from django import forms
from django.forms import ValidationError
from matplotlib.pyplot import text
from admin_hostal.models import Proveedor

class ProveedorForm(forms.ModelForm): 
    nombre_prov = forms.CharField(min_length=3, max_length=35,null=False,blank = False, type=text,required=True)
    email = forms.EmailField(min_length=3, max_length=100,null=False,blank = False, type=text)
    telefono = forms.IntegerField(type= int) 
    direccion = forms.CharField(min_length=3, max_length=75,null=False,blank = False, type=text)
    rubro = forms.CharField(min_length=3, max_length=35, required=False,null=False,blank = False, type=text)
    
   #validador objetos repetidos 
    def clean_nombre_prov(self):
        nombre_prov = self.cleaned_data["nombre_prov"]
        existe = Proveedor.objects.filter(nombre_prov__iexact=nombre_prov).exists()            
        if existe:
                raise ValidationError("Este proveedor ya existe")            
        return nombre_prov

    def clean_nombre_prov(self):
        name  = self.cleaned_data.get('nombre_prov')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el nombre basio'])
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

      
    def clean_rubro (self):
        name  = self.cleaned_data.get('rubro ')
        if len(name) == 0 :
            self._errors['name'] = self.error_class([
                'No se puede dejar el rubro  basio'])
            return self.cleaned_data 


    class Meta:
        model = Proveedor
        fields ='__all__'
        
    #formulario para editar(sin objetos repetidos) 
class ProveedorEdit(forms.ModelForm):
    nombre_prov = forms.CharField(min_length=3, max_length=35,null=False,blank = False, type=text)
    email = forms.EmailField(min_length=3, max_length=100,null=False,blank = False, type=text)
    telefono = forms.IntegerField(type= int) 
    direccion = forms.CharField(min_length=3, max_length=75,null=False,blank = False, type=text)
    rubro = forms.CharField(min_length=3, max_length=35, required=False,null=False,blank = False, type=text)
    
    class Meta:
        model = Proveedor
        fields ='__all__'
