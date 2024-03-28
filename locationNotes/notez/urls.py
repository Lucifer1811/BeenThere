from django.urls import path, include
from rest_framework.routers import DefaultRouter
from notez.views import NoteViewSet

router = DefaultRouter()
router.register(r'notes', NoteViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
