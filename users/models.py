from django.db import models
from django.contrib.auth.models import AbstractUser


class CustomUser(AbstractUser):
    is_librarian = models.BooleanField(default=False)
    is_member = models.BooleanField(default=False)


    groups = models.ManyToManyField(
        'auth.Group',
        related_name='customer_set',
        blank=True,
    )

    user_permissions = models.ManyToManyField(
        'auth.Permission',
        related_name='Customer_set',
        blank=True
    )

