@echo off

echo.
echo 1. Starting SSH service for CI/CD...
wsl -d Ubuntu -u root service ssh start

echo.
echo 2. Pulling latest code...
wsl -d Ubuntu -u quang -e bash -c "cd /mnt/d/Devops/devops-project-fork && git pull origin main"

echo.
echo 3. Starting Todo (Frontend + Backend + DB)...
wsl -d Ubuntu -u quang -e bash -c "cd /mnt/d/Devops/devops-project-fork && docker compose pull && docker compose up -d --build"

echo.
echo SERVER ONLINE
pause
