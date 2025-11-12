@echo off
echo Starting Django server...
start /B python manage.py runserver 8000
timeout /t 5 /nobreak > nul

echo Running Newman tests...
newman run tests/api/postman/ToDoApp-Collection.postman_collection.json -e tests/api/postman/ToDoApp-Environment.postman_environment.json -r htmlextra --reporter-htmlextra-export reports/

echo Stopping Django server...
taskkill /f /im python.exe > nul 2>&1