#Use the official Python image from Docker Hub
FROM python:3.9

#Set the ENV Variables to prevent .pyc files and enable unbufferes mode
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# COPY the entire project into the container
COPY . /app/

# Command to run when starting the container
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "project.wsgi:application"]