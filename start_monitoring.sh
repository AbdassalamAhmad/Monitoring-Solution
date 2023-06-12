#!/bin/bash

# Start Docker Compose
echo "Starting Docker Compose..."
docker-compose up --build -d
echo "Docker Compose started."

# Wait for containers to be up and running
echo "Waiting for containers to be up and running..."
containers_up=false

while [ "$containers_up" = false ]; do
    containers=$(docker ps --format "{{.Names}}")
    containers_up=true

    for container in $containers; do
        container_state=$(docker inspect --format "{{.State.Status}}" "$container" | awk '{$1=$1};1')

        if [ "$container_state" != "running" ]; then
            containers_up=false
            break
        fi
    done

    if [ "$containers_up" = false ]; then
        echo "Containers are not yet up. Checking again in 2 seconds..."
        sleep 2
    fi
done

echo "All containers are up and running."

# Stop and remove a specific container
container_name="grafana_dashboard"

# sleep for 65s to wait till grafana works because for the first time, it take much more time than the 2nd one after creating the volume.
sleep 65

echo "Stopping and removing container '$container_name'..."
docker stop "$container_name"
docker rm "$container_name"
echo "Container '$container_name' has been stopped and removed."

# Display completion message
echo "Script execution completed."