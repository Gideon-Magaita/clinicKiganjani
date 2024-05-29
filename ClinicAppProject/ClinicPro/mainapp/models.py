from django.db import models
from django.contrib.auth.models import AbstractUser,Group, Permission
from django.utils.translation import gettext_lazy as _


class CustomUser(AbstractUser):
    # Add or change related_name for groups and user_permissions
    groups = models.ManyToManyField(
        Group,
        verbose_name=_('groups'),
        blank=True,
        related_name='customuser_set',
        related_query_name='user'
    )
    user_permissions = models.ManyToManyField(
        Permission,
        verbose_name=_('user permissions'),
        blank=True,
        related_name='customuser_set',
        related_query_name='user'
    )


class Education(models.Model):
    title = models.CharField(max_length=200,blank=True,null=True)
    file  = models.ImageField(upload_to='images',blank=True,null=True)
    message = models.TextField(blank=True,null=True)
    date = models.DateField(auto_now=True)

    def __str__(self):
        return self.title



class Vaccine(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name
    


class Immunity(models.Model):
    user = models.ForeignKey(CustomUser,on_delete=models.CASCADE)
    hospital_name = models.CharField(max_length=200,default='Mhimbili')
    childs_name = models.CharField(max_length=200,default='child')
    vaccine_name = models.ForeignKey(Vaccine,on_delete=models.CASCADE)
    vaccine_date = models.DateField()
    return_date = models.DateField()
    comment = models.TextField()

    def __str__(self):
        return self.comment
    
EDUCATION_LEVEL=(
    ('none','none'),
    ('secondary','secondary'),
    ('primary','primary'),
    ('university','university'),
)

class ClinicCard(models.Model):
    user = models.ForeignKey(CustomUser,on_delete=models.CASCADE)
    jina_la_clinic = models.CharField(max_length=200)
    jina_la_mama = models.CharField(max_length=200)
    umri_wa_mama = models.IntegerField()
    elimu_ya_mama = models.CharField(max_length=200,choices=EDUCATION_LEVEL)
    kazi_ya_mama = models.CharField(max_length=200)
    urefu_wa_mama = models.DecimalField(max_digits=10,decimal_places=1)
    mimba_ya_ngapi = models.CharField(max_length=200)
    amezaa_mara_ngapi = models.CharField(max_length=200)
    watoto_walio_hai = models.CharField(max_length=200)
    jina_la_mume = models.CharField(max_length=200)
    umri_wa_mume = models.CharField(max_length=200)
    elimu_ya_mume = models.CharField(max_length=200,choices=EDUCATION_LEVEL)
    urefu_wa_mume= models.DecimalField(max_digits=10,decimal_places=1)
    kazi_ya_mume= models.CharField(max_length=200)

    def __str__(self):
        return self.jina_la_mama


class Health(models.Model):
    user = models.ForeignKey(CustomUser,on_delete=models.CASCADE)
    full_name = models.CharField(max_length=200)
    mothers_weight = models.FloatField()
    pregnant_status = models.CharField(max_length=200)
    pregnant_duration = models.CharField(max_length=200)
    blood_preasure = models.CharField(max_length=200)
    child_position = models.CharField(max_length=200)
    other = models.TextField()

    def __str__(self):
        return self.full_name


    





