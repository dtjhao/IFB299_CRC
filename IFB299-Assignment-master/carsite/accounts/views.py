from django.shortcuts import render
from django.http import HttpResponseRedirect
#from django.contrib.auth.forms import UserCreationForm
from accounts.forms import CustomerForm, UserForm
from django.urls import reverse_lazy
from django.views import generic

# Create your views here.
class SignUp(generic.CreateView):
    form_class = UserForm
    success_url = reverse_lazy('login')
    template_name = 'signup.html'

def SignUp2(request):
    if request.method == 'POST':
        form1 = CustomerForm(request.POST)
        form2 = UserForm(request.POST)

        if all([form1.is_valid(), form2.is_valid()]):
            customer = form1.save()
            user = form2.save()
            success_url = reverse_lazy('login')
            return HttpResponseRedirect(success_url)

    else:
        form1 = CustomerForm()
        form2 = UserForm()

    return render(request, 'signup.html', {
        'customer_form': form1,
        'user_form': form2,
    })