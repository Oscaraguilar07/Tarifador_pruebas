from django.contrib import admin
from django.urls import path
from Tarificador.views.user.user import *


urlpatterns = [
    
    path('',login,name='login'),
    # user 
    path('tarificador/inicio/',inicio,name='inicio'),
    path('tarificador/',inicio,name='tarifa'),
    
]
