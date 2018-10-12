from carsite.forms import CustomerForm

customer = Customer.objects.get_or_create(pk=1)
form = CustomerForm(instance=customer)
