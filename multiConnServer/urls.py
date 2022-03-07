from django.urls import path
from . import views

urlpatterns = [
    path('WHO/', views.who),
    path('WHERE/', views.where),
    path('WHY/', views.why),
    path('', views.index, name='index'),
    path('<str:room_name>/', views.room, name='room'),
]