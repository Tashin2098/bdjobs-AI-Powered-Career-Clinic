@echo off
setlocal
cd /d "%~dp0"
set "CAREER_CLINIC_PORT=8768"
title Bdjobs Career Clinic - Gemini Live Realtime Voice

echo =====================================================
echo  BDJOBS CAREER CLINIC - REAL-TIME AUDIO INTERVIEW
echo =====================================================
echo.
echo Address: http://127.0.0.1:8768
 echo.
where python >nul 2>nul
if not errorlevel 1 (
  set "PY_CMD=python"
  goto python_ready
)
where py >nul 2>nul
if not errorlevel 1 (
  set "PY_CMD=py -3"
  goto python_ready
)
echo ERROR: Python not found. Install Python 3 with PATH enabled.
goto finish
:python_ready
if defined GEMINI_API_KEY goto optional_openrouter
echo Enter your GOOGLE AI STUDIO API key for Gemini Live.
echo This key remains in your local server process, never in HTML.
set /p "GEMINI_API_KEY=Gemini API key: "
if not defined GEMINI_API_KEY (
  echo ERROR: No Gemini key entered.
  goto finish
)
:optional_openrouter
if defined OPENROUTER_API_KEY goto launch
echo.
echo Optional: enter your existing OpenRouter key to preserve AI roadmap features.
echo Or press Enter to skip. Live interview does not require OpenRouter.
set /p "OPENROUTER_API_KEY=OpenRouter key optional: "
:launch
echo.
echo Starting local server. Keep this window open.
echo.
%PY_CMD% server.py
set "EXIT_CODE=%errorlevel%"
echo.
echo Server finished. Exit code: %EXIT_CODE%
echo If address is already in use, close old server instances.
:finish
pause
endlocal
