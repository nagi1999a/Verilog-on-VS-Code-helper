@echo off

goto main

:check_bin
    echo Adding toolchain path to PATH env...
    set "PATH=%PATH%;%cd%\bin;"
    echo Done!
    echo.
    goto :EOF
    
:check_xvlog
    echo Adding xvlog path to PATH env...
    if NOT EXIST xvlog_path (
        call :set_xvlog
    ) else (
        set /p XVLOG_PATH=<xvlog_path
    )
    set "PATH=%PATH%;%XVLOG_PATH%"
    echo Done!
    echo.
    goto :EOF
    
:set_xvlog
    echo Please choose xvlog.bat path...
    echo Which maybe somewhere like C:\Xilinx\Vivado\2020.1\bin\xvlog.bat
    tools\getdir > xvlog_path
    set /p XVLOG_PATH=<xvlog_path
    goto :EOF

:check_exts
    echo Checking extensions...
    if not exist is_install_exts (
        call :set_exts
        echo . > is_install_exts
    )
    echo .
    goto :EOF

:set_exts
    echo Installing extensions...
    for /r %%i in (extensions\*.vsix) do (
        "..\bin\code.cmd" --extensions-dir %cd%\extensions --user-data-dir %cd%\data --install-extension %%i 
    )
    echo .
    goto :EOF
:final_check
    echo Confirming...
    where test_access 2> nul 1> nul
    if "%errorlevel%" NEQ "0" (
        echo Cannot access test_Access! Please restart this file!
        exit /B 1
    )
    where xvlog 2> nul 1> nul
    if "%errorlevel%" NEQ "0" (
        echo Cannot access xvlog! Please restart this file!
        del xvlog_path
        exit /B 1
    )
    echo Done!
    echo.
    exit /B 0

:main
    call :check_bin
    call :check_xvlog
    call :check_exts
    call :final_check
    if "%errorlevel%" NEQ "0" (
        pause
        exit 1
    )
    echo Starting VS code
    start "" "..\Code.exe" --extensions-dir %cd%\extensions --user-data-dir %cd%\data