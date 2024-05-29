from django.shortcuts import render,redirect
from rest_framework import viewsets
from rest_framework import generics, permissions, status
from rest_framework.permissions import AllowAny
from .models import *
from .serializers import *
from .forms import *
from django.contrib import messages
#authentication imports
from rest_framework import generics, permissions
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate
import logging
from django.contrib.auth import authenticate, login, logout
from .decorators import unauthenticated_user,admin_only
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group




@unauthenticated_user
def login_user(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username,password=password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request,'username or password is incorrect') 

    return render(request,'pages/auth/login.html')

#user logout
def logoutUser(request):
    logout(request)
    return redirect('login_user')

#user registration
# class UserCreateAPIView(generics.CreateAPIView):
#     permission_classes = [permissions.AllowAny]
#     queryset = CustomUser.objects.all()
#     serializer_class = UserSerializer

class UserCreateAPIView(generics.CreateAPIView):
    permission_classes = [permissions.AllowAny]
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        # Get the group you want to assign the user to (you might need to change the group name)
        group, _ = Group.objects.get_or_create(name='users')

        # Assign the user to the group
        serializer.instance.groups.add(group)

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

#login function
logger = logging.getLogger(__name__)

class UserLoginAPIView(generics.GenericAPIView):
    permission_classes = [permissions.AllowAny]
    serializer_class = LoginSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            username = serializer.validated_data.get('username')
            password = serializer.validated_data.get('password')
            user = authenticate(request=request, username=username, password=password)
            if user:
                token, _ = Token.objects.get_or_create(user=user)
                return Response({"token": token.key})
            else:
                logger.error(f'Authentication failed for user: {username}')
                return Response({"non_field_errors": ["Unable to log in with provided credentials"]}, status=status.HTTP_400_BAD_REQUEST)
        else:
            logger.error(f'Serializer validation failed: {serializer.errors}')
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



#################################Home functions #################################
@login_required(login_url='login_user')
@admin_only
def home(request):
    educatuon_count = Education.objects.all().count()
    card_count = ClinicCard.objects.all().count()
    health_count = Health.objects.all().count()
    context={
        'educatuon_count':educatuon_count,
        'card_count':card_count,
        'health_count':health_count
    }
    return render(request,'pages/home.html',context)


# class EducationList(generics.ListAPIView):
#     queryset = Education.objects.all()
#     serializer_class = EducationModelSerializer

class EducationList(generics.ListAPIView):
    queryset = Education.objects.all()
    serializer_class = EducationModelSerializer
    authentication_classes = []  # Disabling authentication for this view
    permission_classes = [AllowAny]  # Allowing access to anyone, authenticated or not

    

class ImmunityList(generics.ListAPIView):
    serializer_class = ImmunityModelSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        return Immunity.objects.filter(user=user)


class ClinicCardList(generics.ListAPIView):
    serializer_class = ClinicCardSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return ClinicCard.objects.filter(user=self.request.user)
    


class HealthList(generics.ListAPIView):
    serializer_class = HealthSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Health.objects.filter(user=self.request.user)

        

#django views
def education_list(request):
    education = Education.objects.all().order_by('-date')
    if request.method == 'POST':
        form = EducationForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request, "Education details saved successfully")
            return redirect('education_list')
        else:
            messages.error(request, "Something went wrong")
            return redirect('education_list')
    else:
        form = EducationForm()
    context={
        'form':form,
        'education':education,
    }
    return render(request,'pages/education.html',context)



def edit_education(request, id):
    education = Education.objects.get(id=id)
    form = EducationForm(request.POST or None,request.FILES or None,instance=education)
    if form.is_valid():
        form.save()
        messages.success(request,'Education details updated')
        return redirect('education_list')
    return render(request,'pages/edit-education.html',{'form':form})


def delete_education(request,id):
    education = Education.objects.get(id=id)
    education.delete()
    messages.success(request,'Education details deleted')
    return redirect('education_list')


def vaccine_name(request):
    vaccine = Vaccine.objects.all()
    if request.method == 'POST':
        form = VaccineForm(request.POST or None)
        if form.is_valid(): 
            form.save()
            messages.success(request, "Vaccine details  successfully")
            return redirect('vaccine_name')
        else:
            messages.error(request, "Vaccine details not valid")
            return redirect('vaccine_name')
    else:
        form = VaccineForm()
    context={
        'form': form,
        'vaccine':vaccine,
    }
    return render(request,'pages/vaccine-name.html',context)



def edit_vaccine(request,id):
    vaccine = Vaccine.objects.get(id=id)
    form = VaccineForm(request.POST or None,instance=vaccine)
    if form.is_valid():
        form.save()
        messages.success(request,'Vaccine has been updated')
        return redirect('vaccine_name')
    return render(request,'pages/edit-vaccine.html',{'form':form})


def vaccine(request):
    vaccine = Immunity.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = ImmunityForm(request.POST or None)
        if form.is_valid():
            data = form.save(commit=False)
            data.user = request.user
            data.save()
            messages.success(request, "Vaccine details saved successfully")
        else:
            messages.error(request, "Something went wrong")
            return redirect('vaccine')
    else:
        form = ImmunityForm()
    context={
        'form':form,
        'vaccine':vaccine,
    }
    return render(request,'pages/vaccine.html',context)


def edit_vaccine_details(request,id):
    immune = Immunity.objects.get(id=id)
    form = ImmunityForm(request.POST or None,instance=immune) 
    if form.is_valid():
        form.save()
        messages.success(request,'successfully updated')
        return redirect('vaccine')
    return render(request,'pages/edit-vaccine-details.html',
            {'form':form})




def clinic_card(request):
    clinic_cards = ClinicCard.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = ClinicCardForm(request.POST)
        if form.is_valid():
            data = form.save(commit=False)
            data.user = request.user
            data.save()
            messages.success(request, "Clinic card details saved successfully")
        else:
            messages.info(request, "Something went wrong")
            return redirect('clinic_card')
    else:
        form = ClinicCardForm()
    context = {
        'form': form,
        'clinic_cards': clinic_cards,
    }
    return render(request, 'pages/clinic-card.html', context)


def health(request):
    healths = Health.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = HealthForm(request.POST)
        if form.is_valid():
            data = form.save(commit=False)
            data.user = request.user
            data.save()
            messages.success(request, "Health details saved successfully")
        else:
            messages.info(request, "Something went wrong")
            return redirect('health')
    else:
        form = HealthForm()
    context = {
        'form': form,
        'healths': healths,
    }
    return render(request, 'pages/health.html', context)


def edit_health(request,id):
    health = Health.objects.get(id=id)
    form = HealthForm(request.POST or None,instance=health)
    if form.is_valid():
        form.save()
        messages.success(request,'Health updated successfully')
        return redirect('health')
    context={
        'form': form,
    }
    return render(request,'pages/edit-health.html', context)