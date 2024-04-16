import hashlib
from django.db import models
from django.utils import timezone
from django.db.models.signals import pre_save
from django.dispatch import receiver

class Usuarios(models.Model):
    TIPO_USUARIO_CHOICES = [
        ('normal', 'Normal'),
        ('admin', 'Administrador'),
    ]
    
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    correo_electronico = models.EmailField(unique=True)
    contrasena_hash = models.CharField(max_length=255)
    tipo_usuario = models.CharField(max_length=20, choices=TIPO_USUARIO_CHOICES)
    username = models.CharField(max_length=200, unique=True)
    token = models.CharField(max_length=255, blank=True, null=True)
    fecha_creacion_token = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'usuario'

@receiver(pre_save, sender=Usuarios)
def generate_username_token(sender, instance, **kwargs):
    if not instance.pk:  # Si es un nuevo usuario
        instance.username = (instance.nombre.lower() + "_" + instance.apellido.lower()).replace(" ", "") # Combina nombre y apellido en minúsculas
        instance.token = hashlib.sha256(str(timezone.now()).encode()).hexdigest()  # Genera un token único
        instance.fecha_creacion_token = timezone.now()  # Registra la fecha de creación del token

    def save(self, *args, **kwargs):
        self.contrasena_hash = self.hash_password(self.contrasena_hash)
        super(Usuarios, self).save(*args, **kwargs)

    def hash_password(self, password):
        return hashlib.sha256(password.encode()).hexdigest()
    

class Costo(models.Model):
    costo_recursos = models.CharField(max_length=256)
    costo = models.IntegerField()

    class Meta:
        db_table = 'costo'
        app_label = 'Tarificador'
        
class Perfil(models.Model):
    perfil = models.CharField(max_length=256)
    costo_mes = models.IntegerField()
    costodia = models.IntegerField()

    class Meta:
        db_table = 'perfil'
        app_label = 'Tarificador'

class ProcesosGlobal(models.Model):
    nombre = models.CharField(max_length=256)
    etiquetas_cj = models.CharField(max_length=3, choices=[('Sí', 'Sí'), ('No', 'No')])
    etiquetas_ud = models.CharField(max_length=3, choices=[('Sí', 'Sí'), ('No', 'No')])
    Unidad_de_medida = models.CharField(max_length=256)
    Prod_x_dia_x_rrhh = models.IntegerField()
    dias_holgura = models.IntegerField()

    class Meta:
        db_table = 'procesos_global'
        app_label = 'Tarificador'
