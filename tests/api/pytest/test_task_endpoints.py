import requests
import pytest

BASE_URL = "http://localhost:8000/api"

class TestTaskAPI:
    def test_create_and_delete_task(self):
        # Create task
        response = requests.post(f"{BASE_URL}/tasks/", json={
            "title": "PyTest Task",
            "complete": False
        })
        assert response.status_code == 201
        task_data = response.json()
        assert task_data["title"] == "PyTest Task"
        task_id = task_data["id"]
        
        # Get task
        response = requests.get(f"{BASE_URL}/tasks/{task_id}/")
        assert response.status_code == 200
        assert response.json()["title"] == "PyTest Task"
        
        # Delete task
        response = requests.delete(f"{BASE_URL}/tasks/{task_id}/")
        assert response.status_code == 204
        
        # Verify deletion
        response = requests.get(f"{BASE_URL}/tasks/{task_id}/")
        assert response.status_code == 404

    def test_list_tasks(self):
        response = requests.get(f"{BASE_URL}/tasks/")
        assert response.status_code == 200
        assert isinstance(response.json(), list)