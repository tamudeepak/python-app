# Dockerfile

# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies (although there are none in this simple app)
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the Python application
CMD ["python", "app.py"]
