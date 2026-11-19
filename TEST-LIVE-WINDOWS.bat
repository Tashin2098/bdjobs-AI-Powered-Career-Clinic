@echo off
setlocal
cd /d "%~dp0"
title Gemini Live API Key Diagnostic
where python >nul 2>nul
if not errorlevel 1 (
  set "PY_CMD=python"
  goto ready
)
where py >nul 2>nul
if not errorlevel 1 (
  set "PY_CMD=py -3"
  goto ready
)
echo Python is missing.
goto finish
:ready
if defined GEMINI_API_KEY goto test
set /p "GEMINI_API_KEY=Google AI Studio API key: "
if not defined GEMINI_API_KEY goto finish
:test
%PY_CMD% diagnose_gemini_live.py
:finish
pause
endlocal
