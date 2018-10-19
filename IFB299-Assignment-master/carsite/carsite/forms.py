from django import forms
from main.models import Customer, Rental

class CustomerForm(forms.ModelForm):
    gender = forms.ChoiceField(choices = Customer.GENDER_CHOICES, widget=forms.RadioSelect)

    class Meta:
	    model = Customer
	    fields = ['name', 'gender', 'birthday', 'address', 'phone_number', 'occupation']

class RentalForm(forms.ModelForm):
    
    class Meta:
        model = Rental
        fields = ['order_id','vehicle_id','customer_id','start_date','returned_date']
		#remove customer_id, add customer name and phone number