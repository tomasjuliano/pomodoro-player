@echo off
cd /d "%~dp0"
echo Foco y Musica en http://localhost:5173  (cerra esta ventana para apagarla)
start "" http://localhost:5173
python -m http.server 5173 --bind 127.0.0.1
