from django.db import models
from books.models import Book  # Import the Book model from the library app
from users.models import CustomUser  # Import the CustomUser model from the accounts app

class Feedback(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    message = models.TextField()

    # Foreign Key references to external models
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    rating = models.IntegerField()
    comment = models.TextField()

    def __str__(self):
        return f"Feedback from {self.user} on {self.book}"
