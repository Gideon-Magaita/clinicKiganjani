from rest_framework import serializers
from .models import *
from django.contrib.auth import authenticate


#auth function
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['username', 'password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = CustomUser.objects.create_user(**validated_data)
        return user
    

class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField(style={'input_type': 'password'})

    def validate(self, attrs):
        username = attrs.get('username')
        password = attrs.get('password')

        if username and password:
            user = authenticate(request=self.context.get('request'),
                                username=username, password=password)
            if not user:
                raise serializers.ValidationError("Unable to log in with provided credentials.")
        else:
            raise serializers.ValidationError("Must include 'username' and 'password'.")

        attrs['user'] = user
        return attrs

#auth function 


class EducationModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Education
        fields=['id','title','file','message','date']


class ImmunityModelSerializer(serializers.ModelSerializer):
    vaccine_name = serializers.CharField(source='vaccine_name.name')

    class Meta:
        model = Immunity
        fields = ['id','hospital_name','childs_name','vaccine_name','vaccine_date','return_date','comment']


class ClinicCardSerializer(serializers.ModelSerializer):

    class Meta:
        model = ClinicCard
        fields = ['id','jina_la_clinic','jina_la_mama','umri_wa_mama',
                  'elimu_ya_mama','kazi_ya_mama','urefu_wa_mama',
                  'mimba_ya_ngapi','amezaa_mara_ngapi','watoto_walio_hai',
                  'jina_la_mume','umri_wa_mume','elimu_ya_mume',
                  'urefu_wa_mume','kazi_ya_mume']

class HealthSerializer(serializers.ModelSerializer):
    class Meta:
        model = Health
        fields = '__all__'