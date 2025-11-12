#!/bin/bash
echo "Starting Django server..."
python manage.py runserver 8000 &
SERVER_PID=$!
sleep 5

echo "Running PyTest API tests..."
pytest tests/api/pytest/ -v

echo "Running Postman tests..."
rm -rf reports
mkdir -p reports
newman run tests/api/postman/ToDoApp-Collection.postman_collection.json \
  -e tests/api/postman/ToDoApp-Environment.postman_environment.json \
  -r htmlextra \
  --reporter-htmlextra-export reports/newman-report.html

echo "Running Playwright UI tests..."
cd tests/ui/playwright
npm install > /dev/null 2>&1
npx playwright install chromium > /dev/null 2>&1
npm test
cd ../../..

echo "Stopping Django server..."
kill $SERVER_PID

echo "All tests completed! Check reports/ for Newman results."