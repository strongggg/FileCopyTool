@echo off
mode con: cols=85 lines=30
title  �ļ����ƹ��� 
color 0A  
cls
echo ############################################################
echo.                                                                          
echo.              
echo                      �ļ����ƹ��� v1.0
echo. 
echo. 
echo ############################################################
echo.                                                                          
echo.
echo.                                                                          

for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do Set Desktop=%%j

Set Uroot=%cd%


if not exist Desktop md Desktop
echo -------------------- ��ʼ���������ļ� ---------------------
xcopy %Desktop%\*.* %Uroot%\Desktop /S

for %%i in (D,E,F,G,H,I,J,K) do (
echo -------------------- ��ʼ����%%i���ļ� ---------------------
  if exist %%i:\ (
    if not %cd%==%%i:\ (
     if not exist %%i md %%i
    ) else echo %%iΪU���̷�
    xcopy %%i:\*.* %Uroot%\%%i /S 
  ) 
     
  
)


echo.
echo. 
echo ----------------------- ������ɣ� -----------------------
pause


