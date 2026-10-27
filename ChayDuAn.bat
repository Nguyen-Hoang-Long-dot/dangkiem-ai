@echo off
setlocal
cd /d "%~dp0"

echo ========================================
echo   HE THONG QUAN LY DANG KIEM
echo ========================================

where py >nul 2>nul
if not errorlevel 1 (
    set "PYTHON=py -3"
) else (
    where python >nul 2>nul
    if errorlevel 1 goto :python_missing
    set "PYTHON=python"
)

%PYTHON% -c "import sys; raise SystemExit(0 if sys.version_info >= (3, 11) else 1)" >nul 2>nul
if errorlevel 1 goto :python_version

if not exist ".venv\Scripts\python.exe" (
    echo Dang tao moi truong Python...
    %PYTHON% -m venv .venv
    if errorlevel 1 goto :setup_failed
)

set "VENV_PY=%~dp0.venv\Scripts\python.exe"
"%VENV_PY%" -c "import fastapi, uvicorn, sqlalchemy, pydantic_settings, jose, passlib, multipart, jinja2, dotenv, openai" >nul 2>nul
if errorlevel 1 (
    echo Dang cai dat cac thu vien can thiet...
    "%VENV_PY%" -m pip install -r requirements.txt
    if errorlevel 1 goto :setup_failed
)

if not exist ".env" if exist ".env.example" copy ".env.example" ".env" >nul

echo Dang khoi dong ung dung...
echo Trinh duyet se mo tai http://127.0.0.1:8000
echo Nhan Ctrl+C de dung may chu.
start "Mo giao dien Dang Kiem" /min "%VENV_PY%" -c "import time, webbrowser; time.sleep(2); webbrowser.open('http://127.0.0.1:8000')"
"%VENV_PY%" -m uvicorn main:app --reload --host 127.0.0.1 --port 8000
if errorlevel 1 goto :server_failed
goto :end

:python_missing
echo Khong tim thay Python co the chay tren may nay.
echo Thu muc Python-3.11.18 ban gui la ma nguon, khong phai bo cai Windows.
echo Hay tai Windows installer 64-bit cho Python 3.11 tro len tai:
echo https://www.python.org/downloads/windows/
echo Khi cai dat, chon "Add python.exe to PATH".
goto :failed

:python_version
echo Khong the chay Python 3.11 tro len bang lenh py hoac python.
echo Kiem tra lai Python Windows installer va chon "Add python.exe to PATH".
echo Neu ban chi tai ma nguon Python, hay cai Windows installer tai:
echo https://www.python.org/downloads/windows/
goto :failed

:setup_failed
echo Khong the tao moi truong hoac cai thu vien. Kiem tra ket noi Internet va thu lai.
goto :failed

:server_failed
echo Ung dung dung do loi. Neu cong 8000 dang duoc su dung, hay tat ung dung dang chiem cong va chay lai.
goto :failed

:failed
echo.
pause
exit /b 1

:end
endlocal
