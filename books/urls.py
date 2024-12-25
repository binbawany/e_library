from django.urls import path
from . import views

urlpatterns = [
    path('', views.BookListView.as_view(), name='book-list'),
    path('<int:pk>/', views.BookDetailView.as_view(), name='book-detail'),
    path('create/', views.book_create, name='book-create'),
    path('<int:pk>/update/', views.book_update, name='book-update'),
    path('<int:pk>/delete/', views.book_delete, name='book-delete'),
]