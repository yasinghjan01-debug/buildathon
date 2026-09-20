$root = $PSScriptRoot
$env:PYTHONPATH = $root
Write-Host "Starting FINOVA Live System..." -ForegroundColor Cyan

Start-Process -FilePath "powershell" -ArgumentList "-NoExit -Command `$env:PYTHONPATH='$root'; C:\Users\vidya\.local\bin\uv.exe run python -m uvicorn apps.api.main:app --host 127.0.0.1 --port 8000"
Start-Sleep -Seconds 2

Start-Process -FilePath "powershell" -ArgumentList "-NoExit -Command npm --prefix apps/web start"
Start-Sleep -Seconds 2

Start-Process "http://localhost:3000"
Write-Host "Live at: http://localhost:3000" -ForegroundColor Green
