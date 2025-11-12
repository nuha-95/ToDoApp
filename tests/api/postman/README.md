# Postman API Tests

## Local Setup

1. Install dependencies:
```bash
pip install -r requirements.txt
```

2. Run migrations:
```bash
python manage.py migrate
```

3. Start Django server:
```bash
python manage.py runserver
```

4. Install Newman:
```bash
npm install -g newman newman-reporter-htmlextra
```

5. Run tests:
```bash
newman run ToDoApp-Collection.postman_collection.json -e ToDoApp-Environment.postman_environment.json -r htmlextra --reporter-htmlextra-export reports/
```

## CI/CD

Tests run automatically on GitHub Actions:
- Sets up Python environment
- Installs dependencies
- Runs migrations
- Starts Django server
- Runs Newman tests
- Uploads HTML report as artifact