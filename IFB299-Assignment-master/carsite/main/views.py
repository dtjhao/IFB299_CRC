from django.http import HttpResponse
from django.http import HttpResponseRedirect
from carsite import forms
from main.models import Customer
from django.contrib.auth import logout, authenticate, login

# from django.views.generic.edit import FormView
# from django.urls import reverse_lazy
# from django.views.generic.edit import CreateView, DeleteView, UpdateView
from django.shortcuts import render

def index(request):
	return render(request, 'staff/home.html')

def create_customer(request):
	if request.method == 'POST':
		#customer, _ = Customer.objects.get_or_create(pk=1)
		form = forms.CustomerForm(request.POST) #request.POST,
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/thanks/')
	else:
		form = forms.CustomerForm()
	return render(request, 'staff/create-customer.html', {'form': form})

def rental_history(request):
	if request.method == 'POST':
		form = forms.RentalForm(request.POST) #request.POST,
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/thanks/')
	else:
		form = forms.RentalForm()
	return render(request, 'staff/rental.html', {'form': form})


