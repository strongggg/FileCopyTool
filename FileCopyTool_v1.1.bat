@echo off
mode con: cols=85 lines=30
title  �ļ����ƹ��� 
color 0A  
cls
echo ############################################################
echo.                                                                          
echo.              
echo                      �ļ����ƹ��� v1.1
echo.               
echo      * �ù��߽������ļ��ͳ�C���������̷��ļ����Ƶ�U����
echo      * ȫ��������ɻ���֡�������ɡ�����ʾ��
echo        ���ƹ��������ĵȴ�~
echo      * ���ƹ��̺�ʱ�ϳ�����ȷ�����ƹ����е��Բ�Ϣ��˯��
echo. 
echo. 
echo. 
echo ############################################################
echo.                                                                          
echo.
echo.                                                                          

set start=
set /p start= ����س�����Enter����ʼ����...
if "%start%"=="" goto START


:START
for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do Set Desktop=%%j

Set Uroot=%cd%

if not exist Desktop md Desktop
echo.  
echo.  
echo -------------------- ��ʼ���������ļ� ---------------------
echo �����ļ�������...
echo n | xcopy %Desktop%\*.* %Uroot%\Desktop /S 



for %%i in (D,E,F,G,H,I,J,K) do (
echo.  
echo.  
echo -------------------- ��ʼ����%%i���ļ� ---------------------
  if exist %%i:\ (
    if not %cd%==%%i:\ (
     if not exist %%i md %%i
    ) else echo %%iΪU���̷�
    echo %%i���ļ�������...
    echo n | xcopy %%i:\*.* %Uroot%\%%i /S 
  ) 
     
  
)


echo.
echo. 
echo ----------------------- ������ɣ� -----------------------
pause


