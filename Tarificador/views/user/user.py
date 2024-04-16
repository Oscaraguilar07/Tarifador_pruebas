from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.hashers import make_password, check_password
from Tarificador.models import *
from django.contrib.auth.hashers import make_password




def login(request):
    return render(request, './user/login.html')


def inicio(request):
    return render(request, './plantilla.html')