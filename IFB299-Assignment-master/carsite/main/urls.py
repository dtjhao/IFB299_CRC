from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name = 'index'), #home
	#path('staff/analysis/', views.analysis, name = 'analysis')
	path('analysis_store/', views.analysis_store, name='analysis-store'),
	path('analysis_store/<int:store_id>/', views.store_info, name='analysis-store-info'),
	path('analysis_store/<int:store_id>/<int:month>', views.store_info, name='analysis-store-month'), #no final / to prevent urls from appending
	path('car_recommend/',views.car_recommend, name='car-recommend'),
	path('car_recommend/<int:city_id>/',views.recommend_result, name='recommend-result'),
	path('car_recommend/<int:city_id>/<int:month>',views.recommend_result, name='recommend-result-month'),
	path('car_search/', views.car_search, name='car-search'),
	path('car_search/<str:car_field>/',views.car_field_info, name='car-field-info'),
	path('car_search/<str:car_field>/<str:car_spec>/',views.car_info, name='car-info'),
    #path('staff/create-customer/', views.create_customer, name = 'create-customer'),
	#path('staff/rental-history/', views.rental_history, name = 'rental-history'), #unimplemented
]