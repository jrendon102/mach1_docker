#!/bin/bash

# Define the path to the docker-compose.yml file
DOCKER_COMPOSE_FILE="docker_compose/docker-compose.yml"

# Check if docker-compose file exists
if [ ! -f "$DOCKER_COMPOSE_FILE" ]; then
    echo "docker-compose.yml file not found at $DOCKER_COMPOSE_FILE"
    exit 1
fi

# Allow Docker containers to access the X server
echo "Allowing Docker containers to access the X server..."
xhost +local:docker

# Build and start the container in detached mode (-d)
echo "Building and starting the container..."
docker compose -f "$DOCKER_COMPOSE_FILE" up --build -d

# Check if the container started successfully
if [ $? -eq 0 ]; then
    echo "Container is up and running!"
else
    echo "There was an error starting the container."
    exit 1
fi
