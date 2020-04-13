@echo off
setlocal

set COUNT=0
set MAXCOUNT=10
set SECONDS=1

:LOOP
cls
@echo "....................\"
call :WAIT
cls
@echo "....................|"
call :WAIT
cls
@echo "..................../"
call :WAIT
cls
@echo "....................-"
call :WAIT
if /i "%COUNT%" equ "%MAXCOUNT%" goto :EXIT
set /a count+=1
rem echo %COUNT%

goto :LOOP

:WAIT
ping -n %SECONDS% 127.0.0.1 > nul
ping -n %SECONDS% 127.0.0.1 > nul
ping -n %SECONDS% 127.0.0.1 > nul
goto :EOF

:EXIT
title FIN!
endlocal