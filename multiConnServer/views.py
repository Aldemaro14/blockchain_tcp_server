from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Room
from .serializers import RoomSerializer
import random
import uuid

##############################################
###  VIEWS  ##################################
##############################################
from django.shortcuts import render

def index(request):
    return render(request, 'chat/index.html')

def room(request, room_name):
    return render(request, 'chat/room.html', {
        'room_name': room_name
    })

##############################################
###  API  ####################################
##############################################

@api_view(['GET'])
def who(request):
    """
    Returns number of clients connected
    """
    return Response(random.randint(0, 9))

@api_view(['GET'])
def where(request):
    """
    Returns server id as string
    """
    rd = random.Random()
    rd.seed(3)
    return Response(uuid.UUID(int=rd.getrandbits(128)))

@api_view(['GET'])
def why(request):
    """
    Returns string 42
    """
    return Response('42')
