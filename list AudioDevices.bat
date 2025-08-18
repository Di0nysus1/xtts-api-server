@echo off
chcp 65001 >nul
set PYTHONIOENCODING=utf-8
call venv\Scripts\activate
cls
py xtts_api_server\check_audio_devices.py
pause