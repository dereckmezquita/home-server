docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker compose up -d
