
# ToDoApp

A simple To-Do list application built with Django and Django REST Framework, featuring comprehensive automated QA testing.

## 📋 Features

* Create, update, and delete tasks
* Mark tasks as completed
* Filter tasks by status
* RESTful API endpoints
* Comprehensive test automation

## 🚀 Setup

### 1. Clone the repository

```bash
git clone https://github.com/nuha-95/ToDoApp.git
cd ToDoApp
```

### 2. Set up a virtual environment

```bash
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Apply migrations

```bash
python manage.py migrate
```

### 5. Create a superuser

```bash
python manage.py createsuperuser
```

### 6. Run the development server

```bash
python manage.py runserver
```

Access the application at `http://127.0.0.1:8000/`.

## 🔧 API Endpoints

* `GET /api/tasks/` - List all tasks
* `POST /api/tasks/` - Create new task
* `GET /api/tasks/:id/` - Get specific task
* `PUT /api/tasks/:id/` - Update task
* `DELETE /api/tasks/:id/` - Delete task

## 🧪 Automated QA Testing

This project features a comprehensive automated testing pipeline with three levels of validation:

### Test Coverage

1. **Unit Tests (PyTest)** - API endpoint validation
2. **Integration Tests (Postman/Newman)** - API testing with response validation
3. **End-to-End Tests (Playwright)** - UI automation and full workflow testing

### Quick Test Execution

```bash
# Install test dependencies
npm install -g newman newman-reporter-htmlextra

# Run all tests
chmod +x run_all_tests.sh
./run_all_tests.sh
```

### Individual Test Suites

```bash
# PyTest API tests
python manage.py runserver &
pytest tests/api/pytest/ -v

# Newman integration tests
./run_newman.sh

# Playwright UI tests
cd tests/ui/playwright
npm install && npx playwright install
npm test
```

### CI/CD Pipeline

GitHub Actions automatically runs all test suites on:
- Push to main/develop branches
- Pull requests to main branch

Test reports are generated and uploaded as artifacts:
- Newman HTML reports
- Playwright test results

### Test Structure

```
tests/
├── api/
│   ├── postman/          # Postman collection & environment
│   └── pytest/           # PyTest API tests
├── ui/
│   └── playwright/       # Playwright UI tests
└── README.md            # Detailed test documentation
```




