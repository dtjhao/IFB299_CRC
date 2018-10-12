from django import forms
from main.models import Customer, Rental

class CustomerForm(forms.ModelForm):
    gender = forms.ChoiceField(choices = Customer.GENDER_CHOICES, widget=forms.RadioSelect)

    class Meta:
	    model = Customer
	    fields = ['first_name', 'last_name', 'gender', 'birthday', 'address', 'phone_number', 'occupation']

class RentalForm(forms.ModelForm):
    
    class Meta:
        model = Rental
        fields = ['customer_id','start_date','due_date','returned_date','vehicle_id','damaged_info','lost']