@echo off
mode con: cols=85 lines=30
setlocal enabledelayedexpansion
title  文件复制工具 
color 0A  
cls
echo ############################################################
echo.                                                                          
echo.              
echo                      文件复制工具 v2.2
echo.
echo      * 该工具将桌面文件和除C盘外其它盘符文件复制到U盘中
echo      * 全部复制完成会出现“复制完成”的提示，
echo        复制过程请耐心等待~
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
echo -------------------- 开始复制桌面文件 ---------------------
echo 正在计算桌面文件大小...
dir /s /b %Desktop% > tmp.txt

for /f %%i in ('dir %Desktop% /s /W /B ^| find /v /c "" ') do set FILECOUNT=%%i
set /a n=0
for /f "delims=" %%i in (tmp.txt) do ( 
if exist %%i if not exist %%i\nul echo f | xcopy %%i %Uroot%\Desktop%%~pi /S /Q
set /a n=n+1
set /a per=n*100/!FILECOUNT!
cls
echo -------------------- 正在复制桌面文件 ---------------------
echo 桌面文件复制进度：!per!%%

)



for %%i in (D,E,F,G,H,I,J,K) do (
echo -------------------- 开始复制%%i盘文件 ---------------------
  if exist %%i:\ (
    if not %cd%==%%i:\ (
     if not exist %%i md %%i
     echo 正在计算%%i盘文件大小...

     dir /s /b %%i:\ > tmp.txt
	
     for /f %%s in ('dir %%i:\ /s /W /B ^| find /v /c "" ') do set FILECOUNT=%%s
	 
     set /a n=0
     for /f "delims=" %%q in (tmp.txt) do ( 
        if exist %%q if not exist %%q\nul echo f | xcopy %%q %Uroot%\%%i%%~pq /S /Q
        set /a n=n+1
        set /a per=n*100/!FILECOUNT!
		cls 
        echo -------------------- 正在复制%%i盘文件 ---------------------
        echo %%i盘文件复制进度：!per!%%
	
    )
    ) else echo %%i为U盘盘符
    

  ) 
     
  
)


echo.
echo. 
echo ----------------------- 复制完成！ -----------------------
pause


