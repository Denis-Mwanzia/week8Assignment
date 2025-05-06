from django.urls import path
from .views import TaskListCreateView, TaskDetailView, api_root

urlpatterns = [
    path('', api_root, name='api-root'),  # now /api/ works
    path('tasks/', TaskListCreateView.as_view(), name='task-list-create'),
    path('tasks/<int:pk>/', TaskDetailView.as_view(), name='task-detail'),
]
