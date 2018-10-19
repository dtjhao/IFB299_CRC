from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from main.models import Customer

class CustomerForm(forms.ModelForm):
    gender = forms.ChoiceField(choices = Customer.GENDER_CHOICES, widget=forms.RadioSelect)

    class Meta:
	    model = Customer
	    fields = ['name', 'gender', 'birthday', 'address', 'phone_number', 'occupation']



class UserForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ['username', 'password1', 'password2', 'email']

    def save(self, commit=True):
        user = super(UserForm, self).save(commit=False)
        user.email = self.cleaned_data["email"]
        if commit:
            user.save()
        return user
