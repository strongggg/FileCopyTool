@echo off
mode con: cols=85 lines=30
title  文件复制工具 
color 0A  
cls
echo ############################################################
echo.                                                                          
echo.              
echo                      文件复制工具 v1.2
echo.               
echo      * 该工具将桌面文件和除C盘外其它盘符文件复制到U盘中
echo      * 全部复制完成会出现“复制完成”的提示，
echo        如果复制过程中滚屏停止了，是因为正在复制大文件，
echo        请耐心等待~
echo      * 复制过程耗时较长，请确保复制过程中电脑不息屏睡眠
echo. 
echo. 
echo. 
echo ############################################################
echo.                                                                          
echo.
echo.                                                                          

set start=
set /p start= 输入回车键（Enter）开始复制...
if "%start%"=="" goto START


:START
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do Set Desktop=%%j

Set Uroot=%cd%

if not exist Desktop md Desktop
echo.  
echo.  
echo -------------------- 开始复制桌面文件 ---------------------
echo 桌面文件复制中...
xcopy %Desktop%\*.* %Uroot%\Desktop /S /D



for %%i in (D,E,F,G,H,I,J,K) do (
echo.  
echo.  
echo -------------------- 开始复制%%i盘文件 ---------------------
  if exist %%i:\ (
    if not %cd%==%%i:\ (
     if not exist %%i md %%i
     echo %%i盘文件复制中...
     xcopy %%i:\*.* %Uroot%\%%i /S /D
    ) else echo %%i为U盘盘符
    
  ) 
     
  
)


echo.
echo. 
echo ----------------------- 复制完成！ -----------------------
pause


