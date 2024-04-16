from django.http import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.forms import PasswordChangeForm
from django.db import IntegrityError
from django.contrib.auth import update_session_auth_hash
from django.contrib import*
from Tarificador.models import *

from django.shortcuts import redirect

def eliminar_usuario(request, usuario_id):
    usuario = get_object_or_404(Usuario, pk=usuario_id)
    
    if request.method == 'POST':  # Cambiado a POST en lugar de DELETE
        usuario.delete()
        return redirect('gestion_user')  # Redirigir a la vista de gestión de usuarios
    else:
        return JsonResponse({'error': 'Método no permitido'}, status=405)

    
def modificar_usuario(request, usuario_id):
    usuario = get_object_or_404(Usuario, pk=usuario_id)
    
    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        apellido = request.POST.get('apellido')
        correo_electronico = request.POST.get('correo')
        

        usuario.nombre = nombre
        usuario.apellido = apellido
        usuario.correo_electronico = correo_electronico
        usuario.save()
        
        return redirect('gestion_user')
    else:
        return JsonResponse({'error': 'Método no permitido'}, status=405)

def gestion_user_process(request):
    usuarios = Usuario.objects.all()
    return render(request, 'admin/gestion_user.html', {'usuarios': usuarios})


def crear_usuario(request):
    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        apellido = request.POST.get('apellido')
        correo_electronico = request.POST.get('correo_electronico')
        contrasena_hash = hash(request.POST.get('contrasena'))  # Guardar la contraseña como un hash
        tipo_usuario = request.POST.get('tipo_usuario')
        username = request.POST.get('username')

        try:
            # Verifica si el nombre de usuario ya está en uso
            if Usuario.objects.filter(username=username).exists():
                raise IntegrityError('El nombre de usuario ya está en uso.')
            
            # Verifica si el correo electrónico ya está en uso
            if Usuario.objects.filter(correo_electronico=correo_electronico).exists():
                raise IntegrityError('El correo electrónico ya está en uso.')

            # Crea el nuevo usuario si no hay problemas con el nombre de usuario y correo electrónico
            nuevo_usuario = Usuario(
                nombre=nombre,
                apellido=apellido,
                correo_electronico=correo_electronico,
                contrasena_hash=contrasena_hash,
                tipo_usuario=tipo_usuario,
                username=username
            )
            nuevo_usuario.save()
            
            # Redirige a la página de gestión de usuarios después de crear el usuario exitosamente
            return redirect('gestion_user')
        
        except IntegrityError as e:
            # Maneja la excepción IntegrityError para nombre de usuario y correo electrónico duplicados
            messages.error(request, str(e))
            # Vuelve a renderizar la misma página de creación de usuario con el mensaje de error
            return render(request, 'admin/creacion_user_admin.html')

    else:
        # Renderiza la página de creación de usuario
        return render(request, 'admin/creacion_user_admin.html')

def cambio_admin(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
        
        return redirect('gestion_user')  
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'admin/cambio_admin.html', {'form': form})
