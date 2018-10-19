from django.db import models
from django.utils.timezone import now
import datetime


# Create your models here.

class State(models.Model):
	abbreviation = models.CharField(max_length = 3, primary_key = True) #e.g. TAS
	name = models.CharField(max_length = 20) #e.g. tasmania
	def __str__(self):
		return '{0}, {1}'.format(self.abbreviation, self.name)
#def __init__(self, abbreviation, name):
#        self.abbreviation = abbreviation
#        self.name = name
#def __str__(self):
#	return 'abb={0}, name={1}'.format(self.abbreviation, self.name)

class City(models.Model):
	city_id = models.AutoField(primary_key = True) #Newly implemented
	state_abb = models.ForeignKey(State, on_delete = models.CASCADE, db_column = 'state_abb')
	name = models.CharField(max_length = 50)
	def __str__(self):
		return '{0}'.format(self.name)

class Store(models.Model):
	store_id = models.IntegerField(primary_key = True)
	name = models.CharField(max_length = 100)
	address = models.CharField(max_length = 60)
	phone = models.CharField(max_length = 20)
	city_id = models.ForeignKey(City, on_delete = models.CASCADE, db_column = 'city_id')
	def __str__(self):
		return self.name
	

class Maker(models.Model):
	maker_id = models.AutoField(primary_key = True) #Newly implemented
	name = models.CharField(max_length = 50)
	def __str__(self):
		return self.name

class Series(models.Model):
	series_id = models.AutoField(primary_key = True) #Newly implemented
	maker_id = models.ForeignKey(Maker, on_delete = models.CASCADE, db_column = 'maker_id')
	model = models.CharField(max_length = 50)
	series = models.CharField(max_length = 50)
	year = models.PositiveSmallIntegerField()
	price = models.IntegerField()
	engine_size = models.CharField(max_length=5)
	fuel_system = models.CharField(max_length = 20)
	tank_capacity = models.CharField(max_length=5)
	power = models.CharField (max_length = 20)
	seating = models.IntegerField()
	standard_transmission = models.CharField(max_length = 10)
	body_type = models.CharField(max_length = 15)
	car_drive = models.CharField(max_length = 4)
	car_wheelbase = models.CharField(max_length = 8)

	class Meta:
		unique_together = ('maker_id', 'model', 'series', 'year')
	def __str__(self):
		return '{0}, {1}, {2}'.format(self.maker_id.name,self.model,self.series,self.year)

class VehicleInstance(models.Model):
	vehicle_id = models.IntegerField(primary_key = True)
	series_id = models.ForeignKey(Series, on_delete = models.CASCADE, db_column = 'series_id')
	def __str__(self):
		return format(self.vehicle_id)

class Customer(models.Model):
	GENDER_CHOICES = (('M', 'MALE'),('F','FEMALE'))

	customer_id = models.AutoField(primary_key = True) #Newly implemented for online registered users. Importing existing customers must be done while auto is off
	name = models.CharField(max_length = 40)
	gender = models.CharField(max_length = 1, choices = GENDER_CHOICES)
	birthday = models.DateField(blank=True)
	address = models.CharField(max_length = 150)
	phone_number = models.CharField(max_length = 30)
	occupation = models.CharField(max_length = 30)
	class Meta:
		unique_together = ('name', 'phone_number') #so forms won't need customer id
	def __str__(self):
		return '{0}, {1}'.format(self.name, self.phone_number) #may revert back to just name
	

class Rental(models.Model):
	order_id = models.IntegerField(primary_key = True)
	start_date = models.DateField(blank = True)
	returned_date = models.DateField(blank=True)
	order_date = models.DateField(editable=False)
	vehicle_id = models.ForeignKey(VehicleInstance, on_delete = models.CASCADE, db_column = 'vehicle_id')
	customer_id = models.ForeignKey(Customer, on_delete = models.CASCADE, db_column = 'customer_id')
	pick_up_store_id = models.ForeignKey(Store, on_delete = models.CASCADE, db_column = 'pick_up_store_id', related_name='pick_up_store_id')
	return_store_id = models.ForeignKey(Store, on_delete = models.CASCADE, db_column = 'return_store_id', related_name='return_store_id')

	def save(self):
		if not self.id:
			self.order_date = datetime.date.today()
		super(Rental, self).save()
	def __str__(self):
		return format(self.order_id)
