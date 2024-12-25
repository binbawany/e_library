# Django E-Library Project

## Overview
This is a Django-based application for managing an online library system. It includes features for user management, book management, and feedback submission. The project is designed for production deployment using Docker, PostgreSQL, and Nginx.

---

## Features
- User authentication (registration, login, logout).
- Book catalog management.
- Feedback and reviews for books.
- Production-ready setup with Docker Compose.

---

## Prerequisites
- **Python 3.12+**
- **PostgreSQL 15+**
- **Docker and Docker Compose**
- **Git**

---

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/<repository-name>.git
cd <repository-name>
```

### 2. Set Up Environment Variables
Create a `.env` file in the project root with the following variables:
```env
# Django settings
SECRET_KEY=your-secret-key
DEBUG=False
ALLOWED_HOSTS=127.0.0.1,localhost

# Database settings
POSTGRES_DB=e_library
POSTGRES_USER=your-db-user
POSTGRES_PASSWORD=your-db-password
POSTGRES_HOST=db
POSTGRES_PORT=5432
```

### 3. Build and Run with Docker Compose
```bash
docker-compose up --build -d
```

---

## Accessing the Application
- The application will be accessible at [http://localhost:80](http://localhost:80).
- Django admin panel: [http://localhost:80/admin](http://localhost:80/admin)
  - Create a superuser with:
    ```bash
    docker-compose exec web python manage.py createsuperuser
    ```

---

## Folder Structure
- **`/templates/`**: Contains HTML templates for the application.
- **`/static/`**: Contains static files (CSS, JS, images).
- **`/nginx.conf`**: Nginx configuration for reverse proxy.
- **`Dockerfile`**: Multi-stage Dockerfile for production.
- **`docker-compose.yml`**: Docker Compose configuration.

---

## Running Locally (Without Docker)
1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
2. Apply migrations:
   ```bash
   python manage.py migrate
   ```
3. Run the development server:
   ```bash
   python manage.py runserver
   ```

---

## Troubleshooting
- **Database Connection Issues**: Ensure the PostgreSQL service is running and the `.env` file is correctly configured.
- **Static Files Not Loading**: Run `python manage.py collectstatic` to gather static files.
- **Permission Errors**: Check Docker volume permissions.

---

## Contribution
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit changes and push:
   ```bash
   git add .
   git commit -m "Add feature"
   git push origin feature-name
   ```
4. Open a pull request.

---

## License
This project is licensed under the [MIT License](LICENSE).

---

## Author
- **Bin Bawany**
- **Email**: b2bawany@gmail.com

