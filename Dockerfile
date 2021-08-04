# Use the Python3.8.1 image
FROM python:3.8.1-slim-buster

# Set the working directory to /usr/src/app
WORKDIR /usr/src/app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Install system dependencies
# libpq-dev needed for pyscopg-2
RUN apt-get update && \ 
    apt-get install -y netcat libpq-dev gcc


RUN apt-get update && \
    apt-get upgrade -y

# Install Python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Run run_server.sh
ENTRYPOINT ["./run_server.sh"]