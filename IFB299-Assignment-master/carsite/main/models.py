from django.db import models
from django.utils.timezone import now

# Create your models here.

class State(models.Model):
	abbreviation = models.CharField(max_length = 3, primary_key = True) #e.g. TAS
	name = models.CharField(max_length = 20) #e.g. tasmania

class City(models.Model):
	city_id = models.IntegerField(primary_key = True)
	state = models.ForeignKey(State, on_delete = models.CASCADE)
	name = models.CharField(max_length = 50)

class Store(models.Model):
	store_id = models.IntegerField(primary_key = True)
	name = models.CharField(max_length = 100)
	phone = models.CharField(max_length = 20)
	city = models.ForeignKey(City, on_delete = models.CASCADE)

class Manufacturer(models.Model):
	manufacturer_id = models.IntegerField(primary_key = True)
	name = models.CharField(max_length = 50)

class VehicleData(models.Model):
	vehicle_id = models.IntegerField(primary_key = True)
	manufacturer = models.ForeignKey(Manufacturer, on_delete = models.CASCADE)
	make = models.CharField(max_length = 50)
	model = models.CharField(max_length = 50)
	series = models.IntegerField()
	price = models.IntegerField()
	engine_size = models.IntegerField()
	fuel_system = models.CharField(max_length = 20)
	tank_capacity = models.IntegerField()
	seating = models.IntegerField()
	standard_transmission = models.CharField(max_length = 10)
	body_type = models.CharField(max_length = 15)
	car_drive = models.CharField(max_length = 5)
	car_wheelbase = models.IntegerField()

class VehicleInstance(models.Model):
	vd_id = models.ForeignKey(VehicleData, on_delete = models.CASCADE)
	licence_plate = models.CharField(max_length = 8, primary_key = True)
	store = models.ForeignKey(Store, on_delete = models.CASCADE)

class Customer(models.Model):
	GENDER_CHOICES = (('M', 'MALE'),('F','FEMALE'),('O','OTHER'))

	customer_id = models.AutoField(primary_key = True)
	first_name = models.CharField(max_length = 30)
	last_name = models.CharField(max_length = 30)
	gender = models.CharField(max_length = 1, choices = GENDER_CHOICES)
	birthday = models.DateField(default=now, blank=True)
	address = models.CharField(max_length = 150)
	phone_number = models.CharField(max_length = 15)
	occupation = models.CharField(max_length = 30)
	

class Rental(models.Model):
	start_date = models.DateField(default=now)
	due_date = models.DateField(default=now)
	returned_date = models.DateField(default=now, blank=True)
	vehicle_id = models.ForeignKey(VehicleInstance, on_delete = models.CASCADE)
	damaged_info = models.CharField(max_length = 1000)
	lost = models.BooleanField()
	customer_id = models.ForeignKey(Customer, on_delete = models.CASCADE)

class Promotion(models.Model):
	vd_id = models.ForeignKey(VehicleData, on_delete = models.CASCADE)
	city_id = models.ForeignKey(City, on_delete = models.CASCADE)
	month = models.IntegerField()
	year = models.IntegerField()
