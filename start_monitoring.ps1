# Start Docker Compose
Write-Host "Starting Docker Compose..."
docker-compose up --build -d
Write-Host "Docker Compose started."

# Wait for containers to be up and running
Write-Host "Waiting for containers to be up and running..."
$containersUp = $false

while (-not $containersUp) {
    $containers = docker ps --format "{{.Names}}"
    $containersUp = $true

    foreach ($container in $containers) {
        $containerState = (docker inspect --format "{{.State.Status}}" $container).Trim()

        if ($containerState -ne "running") {
            $containersUp = $false
            break
        }
    }

    if (-not $containersUp) {
        Write-Host "Containers are not yet up. Checking again in 2 seconds..."
        Start-Sleep -Seconds 2
    }
}

Write-Host "All containers are up and running."

# Stop and remove a specific container
$containerName = "grafana_dashboard"

# sleep for 65s to wait till grafana works because for the first time, it take much more time than the 2nd one after creating the volume.
Start-Sleep -Seconds 65

Write-Host "Stopping and removing container '$containerName'..."
docker stop $containerName
docker rm $containerName
Write-Host "Container '$containerName' has been stopped and removed."

# Display completion message
Write-Host "Script execution completed."



