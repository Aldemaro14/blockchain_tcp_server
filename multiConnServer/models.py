from django.db import models

# Create your models here.

class Room(models.Model):
    room_name = models.CharField(max_length=200)
    room_group_name = models.CharField(max_length=200)
    room_id = models.CharField(max_length=200, unique=True)
    status = models.CharField(max_length=200)
