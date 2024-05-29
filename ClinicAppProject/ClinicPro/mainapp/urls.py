from django.urls import path
from .views import *
from . import views
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns=[
    path('api-token-auth/', obtain_auth_token),
    #django-rest-framework urls
    path('',views.home,name='home'),
    path('education',EducationList.as_view()),
    path('vaccine_list',ImmunityList.as_view()),
    path('clinic_list',ClinicCardList.as_view()),
    path('health_list',HealthList.as_view()),
    #auth urls
    path('register/', views.UserCreateAPIView.as_view(), name='user-register'),
    path('login/', views.UserLoginAPIView.as_view(), name='user-login'),
    #django urls
    path('education_list',views.education_list,name='education_list'),
    path('vaccine',views.vaccine,name='vaccine'),
    path('clinic_card',views.clinic_card,name='clinic_card'),
    path('health',views.health,name='health'),
    path('vaccine_name',views.vaccine_name,name='vaccine_name'),
    path('edit_education/<int:id>',views.edit_education,name='edit_education'),
    path('delete_education/<int:id>',views.delete_education,name='delete_education'),
    path('edit_health/<int:id>',views.edit_health,name='edit_health'),
    path('edit_vaccine/<int:id>',views.edit_vaccine,name='edit_vaccine'),
    path('edit_vaccine_details/<int:id>',views.edit_vaccine_details,name='edit_vaccine_details'),
    #auth
    path('login_user',views.login_user,name='login_user'),
    path('logoutUser',views.logoutUser, name='logoutUser'),
]