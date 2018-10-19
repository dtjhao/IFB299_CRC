from django.http import HttpResponse
from django.http import HttpResponseRedirect
from carsite import forms
from main.models import *
from django.contrib.auth import logout, authenticate, login
from django.template import loader
from django.db.models import *

# from django.views.generic.edit import FormView
# from django.urls import reverse_lazy
# from django.views.generic.edit import CreateView, DeleteView, UpdateView
from django.shortcuts import get_object_or_404, render

def index(request):
	return render(request, 'staff/home.html')

def analysis_store(request):
	store_list = Store.objects.all()
	context = {
		'store_list': store_list,
	}
	return render(request, 'staff/analysis_store.html', context)

month_list = Rental.objects.values_list('start_date__month', flat=True).distinct().order_by('start_date__month')

def store_info(request, store_id, month = None):
	store = get_object_or_404(Store, pk=store_id) #(model, attribute)
	if month != None:
		#Number of pick ups for each body type for that month
		body_type_list = Rental.objects.filter(start_date__month=month).filter(pick_up_store_id= store_id).values_list('vehicle_id__series_id__body_type').annotate(Count('order_id'))
	else:
		#Number of pick ups for each body type in general
		body_type_list = Rental.objects.filter(pick_up_store_id= store_id).values_list('vehicle_id__series_id__body_type').annotate(Count('order_id'))
		month = 'ALL MONTHS'
	context = {'store': store,'body_type_list':body_type_list,'month_list':month_list,'month':month}
	return render(request, 'staff/store_info.html', context)

def car_recommend(request):
	city_list = City.objects.all()
	context = {
		'city_list':city_list,
	}
	return render(request,'staff/car_rmd.html', context)

def recommend_result(request, city_id, month = None):
	city = get_object_or_404(City, pk=city_id)
	if month != None:
		body_type_list = Rental.objects.filter(pick_up_store_id__city_id= city_id).filter(start_date__month=month).values_list('vehicle_id__series_id__body_type').annotate(qty=Count('order_id')).order_by('-qty')[:1]
	else:
		body_type_list = Rental.objects.filter(pick_up_store_id__city_id= city_id).values_list('vehicle_id__series_id__body_type').annotate(qty=Count('order_id')).order_by('-qty')[:1]
		month = 'ALL MONTHS'
	context = {
		'city':city,'body_type_list':body_type_list,'month_list':month_list,'month':month
	}
	return render(request,'staff/rmd_result.html', context)

#Do car search FILTER BY by engine size, fuel_system, tank cap, seating , ST ,body type, car drive. dont show series ID, show series, model , make
def car_search(request):
	car_field_list = ['engine_size', 'tank_capacity', 'power','seating', 'standard_transmission', 'body_type', 'car_drive', 'car_wheelbase']
	context = {
		'car_field_list': car_field_list,
	}	
	return render(request, 'staff/car_search.html', context)

def car_field_info(request, car_field):
	if car_field != None:
		#Number of pick ups for each body type for that month
		car_field_values_list = Series.objects.values_list(car_field).distinct().order_by(car_field)
	context = {'car_field_values_list':car_field_values_list, 'car_field':car_field}
	return render(request, 'staff/car_field_info.html', context)

def car_info(request, car_field, car_spec):
	filter = car_field	
	car_spec_list = Series.objects.filter(**{ filter: car_spec })
	context = {'car_spec':car_spec, 'car_field':car_field, 'car_spec_list':car_spec_list}
	return render(request, 'staff/car_info.html', context)










# ABANDONED FUNCTIONS (MISUNDERSTOOD CLIENT BRIEF)
#def create_customer(request):
#	if request.method == 'POST':
#		form = forms.CustomerForm(request.POST)
#		if form.is_valid():
#			form.save()
#			return HttpResponseRedirect('/thanks/')
#	else:
#		form = forms.CustomerForm()
#	return render(request, 'staff/create-customer.html', {'form': form})
#
#def rental_history(request):
#	if request.method == 'POST':
#		form = forms.RentalForm(request.POST) #request.POST,
#		if form.is_valid():
#			form.save()
#			return HttpResponseRedirect('/thanks/')
#	else:
#		form = forms.RentalForm()
#	return render(request, 'staff/rental.html', {'form': form})


