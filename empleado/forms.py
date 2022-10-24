from http.client import NOT_EXTENDED
from django import forms
from django.forms import ValidationError
from matplotlib.pyplot import text
from admin_hostal.models import Empleado

class EmpleadoForm(forms.ModelForm):
    rut_empleado = forms.CharField(min_length=8, max_length=13,Null=False,blank = False, type=text,required=True)
    nombre_empleado = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    p_apellido = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    s_apellido= forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    email = forms.EmailField(min_length=3, max_length=100, Null=False,blank = False, type=text)
    fono = forms.IntegerField(blank=True, Null = True, type = int)
    id_cargo = forms.CharField(min_length=1, max_length=20,Null=False,blank = False, type=text,required=True)

    def clean_rut_empleado(self):
        rut_empleado = self.cleaned_data["rut_empleado"]
        existe = Empleado.objects.filter(rut_empleado__iexact=rut_empleado).exists()
        if existe:
                raise ValidationError("Este empleado ya existe")            
        return rut_empleado



    
     
    def clean_rut_empleado(self):
        name  = self.cleaned_data.get('rut_empleado')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el rut basio'])
            return self.cleaned_data 
    def clean_nombre_empleado(self):
        name  = self.cleaned_data.get('nombre_empleado')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el nombre basio'])
            return self.cleaned_data 

    def clean_p_apellido(self):
            name  = self.cleaned_data.get('p_apellido')
            if len(name) == 0 :
                self._errors['name'] = self.error_class([
                    'No se puede dejar el apellido basio'])
                return self.cleaned_data

    def clean_s_apellido(self):
        name  = self.cleaned_data.get('s_apellido')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el apellido basio'])
            return self.cleaned_data 
    def clean_email(self):
        name  = self.cleaned_data.get('email')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el email basio'])
            return self.cleaned_data 

    def clean_fono(self):
        name  = self.cleaned_data.get('fono')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el fono basio'])
            return self.cleaned_data

    def clean_id_cargo(self):
            name  = self.cleaned_data.get('id_cargo')
            if len(name) == 0 :
                self._errors['name'] = self.error_class([
                    'No se puede dejar el id_cargo basio'])
                return self.cleaned_data
    class Meta:
        model = Empleado
        fields ='__all__'

class EmpleadoEdit(forms.ModelForm):
    rut_empleado = forms.CharField(min_length=8, max_length=13,Null=False,blank = False, type=text,required=True)
    nombre_empleado = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    p_apellido = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    s_apellido= forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    email = forms.EmailField(min_length=3, max_length=100,Null=False,blank = False, type=text)
    fono = forms.IntegerField()

    class Meta:
        model = Empleado
        fields ='__all__'
