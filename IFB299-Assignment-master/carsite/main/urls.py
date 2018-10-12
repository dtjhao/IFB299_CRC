from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name = 'index'), #home
    path('staff/create-customer/', views.create_customer, name = 'create-customer'),
	path('staff/rental-history/', views.rental_history, name = 'rental-history'), #unimplemented
	#path('car-search', views.car_search), #unimplemented
	#path('car-recommendation', views.car_recommendation), #unimplemented
]