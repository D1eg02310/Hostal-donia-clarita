from django import forms
from django.forms import CharField
from jinja2 import ChainableUndefined
from admin_hostal.models import Cliente
from matplotlib.pyplot import text
from django.forms import ValidationError


class ClienteForm(forms.ModelForm):
    class Meta:
        rut_empresa = forms.CharField(min_length=8, max_length=13,Null=False,blank = False, type=text,required=True)
        nombre_empresa = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
        razon_social = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
        email= forms.EmailField(min_length=3, max_length=35,Null=False,blank = False, type=text)
        telefono = forms.IntegerField(Null=True,blank = True, type=int)
        direccion = forms.CharField(blank=True, Null = True, type = text)

    def clean_rut_empresa(self):
        rut_empresa = self.cleaned_data["rut_empresa"]
        existe = Cliente.objects.filter(rut_empresa__iexact=rut_empresa).exists()            
        if existe:
                raise ValidationError("Este cliente ya existe")            
        return rut_empresa


    def clean_nombre_empresa(self):
        nombre_empresa = self.cleaned_data["nombre_empresa"]
        existe = Cliente.objects.filter(nombre_empresa__iexact=nombre_empresa).exists()            
        if existe:
                raise ValidationError("Este cliente ya existe")            
        return nombre_empresa


    def clean_rut_empresa(self):
        name  = self.cleaned_data.get('rut_empresa')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el rut basio'])
            return self.cleaned_data 

    def clean_nombre_empresa(self):
        name  = self.cleaned_data.get('nombre_empresa')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el nombre basio'])
            return self.cleaned_data 

    def clean_nombre_empleado(self):
        name  = self.cleaned_data.get('nombre_empleado')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el nombre basio'])
            return self.cleaned_data

    def clean_razon_social(self):
        name  = self.cleaned_data.get('razon_social')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar la razon socuial basio'])
            return self.cleaned_data    
        

    def clean_email(self):
            name  = self.cleaned_data.get('email')
            if len(name) == 0 :
                self._errors['name'] = self.error_class([
                    'No se puede dejar el email basio'])
                return self.cleaned_data



    def clean_razon_social(self):
        name  = self.cleaned_data.get('razon_social')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar la razon social basio'])
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


    def clean_direccion(self):
        name  = self.cleaned_data.get('direccion')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el direccion basio'])
            return self.cleaned_data 
    
    model = Cliente
    fields ='__all__'

class ClienteEdit(forms.ModelForm):
    rut_empresa = forms.CharField(min_length=8, max_length=13,Null=False,blank = False, type=text,required=True)
    nombre_empresa = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    razon_social = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    email= forms.EmailField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    telefono = forms.IntegerField(Null=True,blank = True, type=int)
    direccion = forms.CharField(blank=True, Null = True, type = text)

    class Meta:
        model = Cliente
        fields ='__all__'