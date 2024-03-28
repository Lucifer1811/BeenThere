from django.db import models
from django.contrib.auth.models import User

class Note(models.Model):
    latitude = models.FloatField()
    longitude = models.FloatField()
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.message[0:75]
    
    class Meta:
        ordering = ['-updated_at']
    