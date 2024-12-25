# Stage 1: Build stage
FROM python:3.11-slim as builder

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/.venv/bin:$PATH"

# Set the working directory
WORKDIR /app

# Install dependencies for building the app
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install poetry for dependency management
RUN pip install --upgrade pip
RUN pip install poetry

# Copy the poetry files and install dependencies
COPY pyproject.toml poetry.lock /app/

# Install dependencies with poetry
RUN poetry install --no-root --only main

# Copy the application code
COPY . /app/

# Stage 2: Production stage
FROM python:3.11-slim as production

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/.venv/bin:$PATH"

# Set the working directory
WORKDIR /app

# Install PostgreSQL dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy only the necessary files for the app (this reduces the final image size)
COPY --from=builder /app /app

# Expose port 8000 for the Django app
EXPOSE 8000

# Command to run the Django application using Gunicorn
CMD ["gunicorn", "e_library.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
