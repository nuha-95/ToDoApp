# ToDoApp Full QA Pipeline

## Test Coverage

- **API Tests (PyTest)** - Unit-level API endpoint validation
- **API Tests (Postman/Newman)** - Integration testing with response validation
- **UI Tests (Playwright)** - End-to-end browser automation

## Quick Start

### Run All Tests
```bash
chmod +x run_all_tests.sh
./run_all_tests.sh
```

### Individual Test Suites
```bash
# PyTest only
python manage.py runserver &
pytest tests/api/pytest/ -v

# Newman only  
./run_newman.sh

# Playwright only
cd tests/ui/playwright && npm install && npm test
```

## CI/CD Pipeline

GitHub Actions runs **all three test suites** automatically:
1. PyTest API tests
2. Postman/Newman integration tests  
3. Playwright UI tests

Reports uploaded as artifacts for each test type.