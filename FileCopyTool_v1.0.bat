@echo off
mode con: cols=85 lines=30
title  文件复制工具 
color 0A  
cls
echo ############################################################
echo.                                                                          
echo.              
echo                      文件复制工具 v1.0
echo. 
echo. 
echo ############################################################
echo.                                                                          
echo.
echo.                                                                          

for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do Set Desktop=%%j

Set Uroot=%cd%


if not exist Desktop md Desktop
echo -------------------- 开始复制桌面文件 ---------------------
xcopy %Desktop%\*.* %Uroot%\Desktop /S

for %%i in (D,E,F,G,H,I,J,K) do (
echo -------------------- 开始复制%%i盘文件 ---------------------
  if exist %%i:\ (
    if not %cd%==%%i:\ (
     if not exist %%i md %%i
    ) else echo %%i为U盘盘符
    xcopy %%i:\*.* %Uroot%\%%i /S 
  ) 
     
  
)


echo.
echo. 
echo ----------------------- 复制完成！ -----------------------
pause


