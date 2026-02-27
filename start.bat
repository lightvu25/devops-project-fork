@echo off
echo ==========================================
echo   DANG CHUAN BI MOI TRUONG DEPLOY...
echo ==========================================

for /f "tokens=1" %%a in ('wsl hostname -I') do set WSL_IP=%%a
echo [+] IP hien tai cua Ubuntu: %WSL_IP%

:: 2. Cap nhat Port Proxy (Dẫn đường cho GitHub Actions)
echo [+] Dang cap nhat Port Proxy vao cong 22...
netsh interface portproxy delete v4tov4 listenport=22 listenaddress=0.0.0.0 >nul 2>&1
netsh interface portproxy add v4tov4 listenport=22 listenaddress=0.0.0.0 connectport=22 connectaddress=%WSL_IP%

:: 3. Fix loi mang va Bat SSH (Fix loi Outbound Git Pull)
echo [+] Dang fix MTU, Checksum va bat SSH service...
wsl -d Ubuntu -u root bash -c "ip link set dev eth0 mtu 1350 && ethtool -K eth0 tx off rx off && service ssh start"

:: 4. Khoi dong Docker Compose (Fix loi 502 Bad Gateway)
echo [+] Dang khoi chay cac Container (Nginx, Backend, DB, Cloudflared)...
wsl -d Ubuntu -u quang bash -c "cd /mnt/d/Devops/devops-project-fork && docker compose up -d"

echo.
echo ==========================================
echo [OK] MOI THU DA SAN SANG! 
echo [!] Dia chi web: https://quang205.dpdns.org
echo ==========================================
pause