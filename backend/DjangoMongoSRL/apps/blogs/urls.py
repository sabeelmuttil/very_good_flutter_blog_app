from django.urls import include, path
from rest_framework import routers
from .views import BlogManage

router = routers.DefaultRouter()
urlpatterns = [
    path('', include(router.urls)),
    path('/blogs', BlogManage.as_view()),
]
