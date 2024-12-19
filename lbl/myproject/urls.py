from django.contrib import admin
from django.urls import path
from myapp.views import BusLocationView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('get/location', BusLocationView.as_view(), name='bus-location'),
]
