from django import forms
from matplotlib.pyplot import text
from admin_hostal.models import Factura
from django.forms import ValidationError

class FacturaForm(forms.ModelForm): 
    fecha = forms.CharField(min_length=8, max_length=13,Null=False,blank = False, type=text,required=True)
    nombre_empresa = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    subtotal = forms.CharField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    iva = forms.CharField(min_length=3, max_length=35,Null=True,blank = True, type=text)
    total = forms.EmailField(min_length=3, max_length=35,Null=False,blank = False, type=text)
    id_cliente = forms.IntegerField(Null=True,blank = True, type=int)

    def clean_fecha(self):
            name  = self.cleaned_data.get('fecha')
            if len(name) == 0 :
                self._errors['name'] = self.error_class([
                    'No se puede dejar la fecha basia'])
                return self.cleaned_data 

    def clean_nombre_empresa(self):
            name  = self.cleaned_data.get('nombre_empresa')
            if len(name) == 0 :
                self._errors['name'] = self.error_class([
                    'No se puede dejar la nombre de la empresa basia'])
                return self.cleaned_data 


    def clean_sub_total(self):
            name  = self.cleaned_data.get('sub_total')
            if len(name) == 0 :
                self._errors['name'] = self.error_class([
                    'No se puede dejar el sub total basio'])
                return self.cleaned_data 


    def clean_iva(self):
                name  = self.cleaned_data.get('iva')
                if len(name) == 0 :
                    self._errors['name'] = self.error_class([
                        'No se puede dejar el iva basio'])
                    return self.cleaned_data 

    def clean_total(self):
            name  = self.cleaned_data.get('total')
            if len(name) == 0 :
                self._errors['name'] = self.error_class([
                    'No se puede dejar el total basio'])
                return self.cleaned_data 


    def clean_id_cliente(self):
            name  = self.cleaned_data.get('id_cliente')
            if len(name) == 0 :
                self._errors['name'] = self.error_class([
                    'No se puede dejar el cliente basio'])
                return self.cleaned_data 


    class Meta:
        model = Factura
        fields ='__all__'