@echo off
title FINOVA - AI Financial Copilot
echo ===================================================
echo   Starting FINOVA Live System
echo   Backend: http://127.0.0.1:8000
echo   Frontend: http://localhost:3000
echo ===================================================

set PYTHONPATH=%~dp0

start "FINOVA Backend (FastAPI)" cmd /k "%USERPROFILE%\.local\bin\uv.exe run python -m uvicorn apps.api.main:app --host 127.0.0.1 --port 8000"
timeout /t 2 /nobreak >nul

start "FINOVA Web (Next.js)" cmd /k "npm --prefix apps\web start"
timeout /t 3 /nobreak >nul

start http://localhost:3000
echo Live system launched!
pause
