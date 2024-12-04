docker build -t vscode-server .
docker compose up -d
docker compose exec vscode-server bash
