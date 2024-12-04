# Stop and remove the running containers for vscode-server
docker compose down

# Clean up unused containers and images
docker container prune -f
docker image prune -f

# Build and run the updated vscode-server
docker compose up --build -d
