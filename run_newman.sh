#!/bin/bash
echo "Starting Django server..."
python manage.py runserver 8000 &
SERVER_PID=$!
sleep 5

echo "Running Newman tests..."
newman run tests/api/postman/ToDoApp-Collection.postman_collection.json \
  -e tests/api/postman/ToDoApp-Environment.postman_environment.json \
  -r htmlextra \
  --reporter-htmlextra-export reports/

echo "Stopping Django server..."
kill $SERVER_PID