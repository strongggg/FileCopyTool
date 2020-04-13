@echo off
mode con cols=113 lines=15 &color 9f
:starthome
cls
set a=^set /p=■%b%^<nul^&ping/n 0 127.1^>nul^&
echo.
echo 程序正在初始化. . .
echo.
echo ┌──────────────────────────────────────────────────────────────────────────────────────────────┐
set/p= 　<nul&%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
echo 100%%
echo └──────────────────────────────────────────────────────────────────────────────────────────────┘

set b=
set a=■
set /a z=100
pause
:start
cls
set a=%a%■■
set /a b+=5
set /a z-=5
echo.
@echo 剩余进度 %z%%%
@echo ┌──────────────────────────────────────────┐
@echo %a% %b%%%
@echo └──────────────────────────────────────────┘
if %b% geq 100 goto num2
ping /n 0 127.1 >nul

set /a sum =5
goto start

:_exit
set /a sum-=1
set/p=%sum% 秒后退出! <nul
echo.
if %sum% EQU 0 exit
ping /n 2 127.1 >nul
goto _exit

rem 冲到一半再缩，冲到一半再加
:num2
setlocal EnableDelayedexpansion
set sum=
Set z=
set a=■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
set /a z1=52
set /a z2=52
:start2
cls
set sum52=
set /a z2=52
set /a sum+=1
set /a z1-=1
set b=!a:~%sum%!
set c=!a:~-%sum%!
call :_color
echo.
echo.
echo 剩余进度:%z1%%%
echo ┌──────────────────────────────────────────────────────┐
echo %b% %z1%%%
echo └──────────────────────────────────────────────────────┘
echo 当前颜色代码: COLOR 0!numca!
echo.
echo.
echo 当前进度:%sum%%%
echo ┌──────────────────────────────────────────────────────┐
echo %c% %sum%%%
echo └──────────────────────────────────────────────────────┘
echo 当前颜色代码: COLOR 0!numca!
if %sum% geq 52 call :sum52
ping /n 0 127.1 >nul
goto start2
:sum52
cls
set sum=
set /a z1=52
set /a sum52+=1
set /a z2-=1
set c=!a:~%sum52%!
set b=!a:~-%sum52%!
call :_color
echo.
echo.
echo 当前进度:%sum52%%%
echo ┌──────────────────────────────────────────────────────┐
echo %b% %sum52%%%
echo └──────────────────────────────────────────────────────┘
echo 当前颜色代码: COLOR 0!numca!
echo.
echo.
echo 剩余进度:%z2%%%
echo ┌──────────────────────────────────────────────────────┐
echo %c% %z2%%%
echo └──────────────────────────────────────────────────────┘
echo 当前颜色代码: COLOR 0!numca!
if %sum52% geq 52 call :start2
ping /n 0 127.1 >nul
cls
goto sum52

:_color
set _color=1234567890ABCDEF
set /a _random=%random%%%16
set numca=!_color:~%_random%,1!
color 0!numca!
goto :eof
