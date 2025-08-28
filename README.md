
# ToDoApp

A simple To-Do list application built with Django.

## 📋 Features


* Create, update, and delete tasks
* Mark tasks as completed
* Filter tasks by status


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

Follow the prompts to set up the admin user.

### 6. Run the development server

```bash
python manage.py runserver
```

Access the application at `http://127.0.0.1:8000/`.




