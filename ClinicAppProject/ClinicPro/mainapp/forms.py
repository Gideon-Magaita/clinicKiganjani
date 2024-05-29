from django import forms
from django.forms import ModelForm
from .models import *

class EducationForm(ModelForm):
    class Meta:
        model = Education
        fields = ['title','file','message']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter education title','required':'required'}),
            'file':forms.FileInput(attrs={'class':'form-control','required':'required'}),
            'message':forms.Textarea(attrs={'class':'form-control'}),
        }


class ImmunityForm(ModelForm):
    class Meta:
        model = Immunity
        fields=['hospital_name','childs_name','vaccine_name','vaccine_date','return_date','comment']

        widgets={
            'hospital_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter hospital name','required':'required'}),
            'childs_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter childs name','required':'required'}),
            'vaccine_name':forms.Select(attrs={'class':'form-control'}),
            'vaccine_date':forms.DateInput(attrs={'class':'form-control','type':'date','required':'required'}),
            'return_date':forms.DateInput(attrs={'class':'form-control','type':'date','required':'required'}),
            'comment':forms.Textarea(attrs={'class':'form-control','type':'text','required':'required'}),
        }

class ClinicCardForm(forms.ModelForm):
    class Meta:
        model = ClinicCard
        fields = [
            'jina_la_clinic',
            'jina_la_mama',
            'umri_wa_mama',
            'elimu_ya_mama',
            'kazi_ya_mama',
            'urefu_wa_mama',
            'mimba_ya_ngapi',
            'amezaa_mara_ngapi',
            'watoto_walio_hai',
            'jina_la_mume',
            'umri_wa_mume',
            'elimu_ya_mume',
            'urefu_wa_mume',
            'kazi_ya_mume'  
        ]

        widgets = {
            'jina_la_clinic': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter clinic name'}),
            'jina_la_mama': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mother\'s name'}),
            'umri_wa_mama': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter mother\'s age'}),
            'elimu_ya_mama': forms.Select(attrs={'class': 'form-control'}),
            'kazi_ya_mama': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mother\'s occupation'}),
            'urefu_wa_mama': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter mother\'s height'}),
            'mimba_ya_ngapi': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter number of pregnancies'}),
            'amezaa_mara_ngapi': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter number of deliveries'}),
            'watoto_walio_hai': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter number of living children'}),
            'jina_la_mume': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter husband\'s name'}),
            'umri_wa_mume': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter husband\'s age'}),
            'elimu_ya_mume': forms.Select(attrs={'class': 'form-control'}),
            'urefu_wa_mume': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter husband\'s height'}),
            'kazi_ya_mume': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter husband\'s occupation'}),
        }


class HealthForm(forms.ModelForm):
    class Meta:
        model = Health
        fields = ['full_name',
                    'mothers_weight',
                    'pregnant_status',
                    'pregnant_duration',
                    'blood_preasure',
                    'child_position',
                    'other'
                    ]
        widgets = {
            'full_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder':'Enter patient full name'}),
            'mothers_weight': forms.NumberInput(attrs={'class': 'form-control','placeholder':'Enter weight in kg'}),
            'pregnant_status': forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter pregnant status'}),
            'pregnant_duration': forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter pregnant duration'}),
            'blood_preasure': forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter blood preasure'}),
            'child_position': forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter child position'}),
            'other': forms.Textarea(attrs={'class': 'form-control','placeholder':'Other comments'}),
        }


class VaccineForm(ModelForm):
    class Meta:
        model = Vaccine
        fields=['name']
        widgets={
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder':'Enter vaccine name'}),
        }