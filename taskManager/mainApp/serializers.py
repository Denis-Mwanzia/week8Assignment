from rest_framework import serializers
from .models import *

class taskSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = ('id', 'title', 'description', 'due_date', 'created_at', 'updated_at', 'status')