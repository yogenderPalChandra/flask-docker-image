# Use the official Python image as the base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV SQLALCHEMY_DATABASE_URI="postgresql://yogi:bittoo@host.docker.internal:5432/mydb"
#ENV DATABASE_URL="postgresql://yogi:bittoo@host.docker.internal:5432/mydb"
#ENV DATABASE_URL="postgresql://postgres:postgres@192.168.2.55:5432/mydb"

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libpng-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose the port that Flask will run on
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "app.py"]
