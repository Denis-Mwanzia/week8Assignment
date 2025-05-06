from rest_framework import generics, permissions
from .models import Task
from .serializers import TaskSerializer

# List all tasks or create a new task (only for the authenticated user)
class TaskListCreateView(generics.ListCreateAPIView): 
    serializer_class = TaskSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self): 
        # Only return tasks belonging to the logged-in user
        return Task.objects.filter(user=self.request.user).order_by('-created_at')

    def perform_create(self, serializer):
        # Automatically set the user to the current authenticated user
        serializer.save(user=self.request.user)

# Retrieve/Read, update, or delete a task by ID (only if it belongs to the logged-in user)
class TaskDetailView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = TaskSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Ensure only the owner can access/modify their tasks
        return Task.objects.filter(user=self.request.user)
