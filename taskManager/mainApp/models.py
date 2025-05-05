from django.db import models

# Model: Task
class Task(models.Model):
    taskID = models.AutoField(primary_key=True)
    title = models.CharField(max_length=200, blank=False, null=False)
    description = models.TextField(blank=True)
    due_date = models.DateField(blank=False)
    completed = models.BooleanField(default=False)
    
    def __str__(self):
        return self.title
    
# 