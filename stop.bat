@echo off

echo.
echo Stopping Todo (Frontend + Backend + DB)...
wsl -d Ubuntu -u quang -e bash -c "cd ~/devops-project-fork && docker compose down"

echo.
echo Stopping SSH service...
wsl -d Ubuntu -u root service ssh stop

echo.
echo SERVER OFFLINE
pause
