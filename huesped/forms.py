from django import forms
from admin_hostal.models import Huesped
from matplotlib.pyplot import text
from django.forms import ValidationError
from admin_hostal.models import CommentModel

class HuespedForm(forms.ModelForm):
    class Meta:
        rut_husped = forms.CharField(min_length=8, max_length=13,Null=False,blank = False, type=text,required=True)
        nombre = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
        p_apellido = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
        s_apellido= forms.CharField(min_length=3, max_length=35,Null=True,blank = True, type=text)
        email= forms.EmailField(min_length=3, max_length=35,Null=False,blank = False, type=text)
        telefono = forms.IntegerField(Null=True,blank = True, type=int)


    def clean_rut_huesped(self):
        rut_huesped = self.cleaned_data["rut_huesped"]
        existe = Huesped.objects.filter(rut_huesped__iexact=rut_huesped).exists()            
        if existe:
                raise ValidationError("Este huesped ya existe")            
        return rut_huesped

    def clean_nombre(self):
            nombre = self.cleaned_data['nombre']
            if not nombre.isalpha():
                raise forms.ValidationError('El nombre no puede contener números')
            return nombre

    def clean_p_apellido(self):
        p_apellido = self.cleaned_data['p_apellido']
        if not p_apellido.isalpha():
            raise forms.ValidationError('El p_apellido no puede contener números')
        return p_apellido


    def clean_s_apellido(self):
        s_apellido = self.cleaned_data['s_apellido']
        if not s_apellido.isalpha():
            raise forms.ValidationError('El s_apellido no puede contener números')
        return s_apellido

    def clean_rut_husped(self):
        name  = self.cleaned_data.get('rut_huesped')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el rut basio'])
            return self.cleaned_data  

    def clean_p_apellido(self):
        name  = self.cleaned_data.get('p_apellido')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el p_apellido basio'])
            return self.cleaned_data 


    def clean_s_apellido(self):
        name  = self.cleaned_data.get('s_apellido')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el s_apellido basio'])
            return self.cleaned_data 

    def clean_email(self):
        name  = self.cleaned_data.get('email')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el email basio'])
            return self.cleaned_data 

    
    def clean_telefono(self):
        name  = self.cleaned_data.get('telefono')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el telefono basio'])
            return self.cleaned_data

    model = Huesped
    fields ='__all__'


    def clean_nombre(self):
        name  = self.cleaned_data.get('nombre')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el nombre basio'])
            return self.cleaned_data   







class HuespedEdit(forms.ModelForm):
    class Meta:
             rut_husped = forms.CharField(min_length=8, max_length=13,Null=False,blank = False, type=text,required=True)
             nombre = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
             p_apellido = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
             s_apellido= forms.CharField(min_length=3, max_length=35,Null=True,blank = True, type=text)
             email= forms.EmailField(min_length=3, max_length=35,Null=False,blank = False, type=text)
             telefono = forms.IntegerField(Null=True,blank = True, type=int)
    model = Huesped
    fields ='__all__'

