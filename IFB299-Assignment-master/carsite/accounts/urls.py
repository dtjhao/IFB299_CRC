from django.urls import include, path
from django.urls import path
from django.contrib.auth import views as auth_views #for login and logout

from . import views


urlpatterns = [
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
	path('signup/', views.SignUp2, name='signup'),

]