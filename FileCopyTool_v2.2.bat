@echo off
mode con: cols=85 lines=30
setlocal enabledelayedexpansion
title  �ļ����ƹ��� 
color 0A  
cls
echo ############################################################
echo.                                                                          
echo.              
echo                      �ļ����ƹ��� v2.2
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
echo -------------------- ��ʼ���������ļ� ---------------------
echo ���ڼ��������ļ���С...
dir /s /b %Desktop% > tmp.txt

for /f %%i in ('dir %Desktop% /s /W /B ^| find /v /c "" ') do set FILECOUNT=%%i
set /a n=0
for /f "delims=" %%i in (tmp.txt) do ( 
if exist %%i if not exist %%i\nul echo f | xcopy %%i %Uroot%\Desktop%%~pi /S /Q
set /a n=n+1
set /a per=n*100/!FILECOUNT!
cls
echo -------------------- ���ڸ��������ļ� ---------------------
echo �����ļ����ƽ��ȣ�!per!%%

)



for %%i in (D,E,F,G,H,I,J,K) do (
echo -------------------- ��ʼ����%%i���ļ� ---------------------
  if exist %%i:\ (
    if not %cd%==%%i:\ (
     if not exist %%i md %%i
     echo ���ڼ���%%i���ļ���С...

     dir /s /b %%i:\ > tmp.txt
	
     for /f %%s in ('dir %%i:\ /s /W /B ^| find /v /c "" ') do set FILECOUNT=%%s
	 
     set /a n=0
     for /f "delims=" %%q in (tmp.txt) do ( 
        if exist %%q if not exist %%q\nul echo f | xcopy %%q %Uroot%\%%i%%~pq /S /Q
        set /a n=n+1
        set /a per=n*100/!FILECOUNT!
		cls 
        echo -------------------- ���ڸ���%%i���ļ� ---------------------
        echo %%i���ļ����ƽ��ȣ�!per!%%
	
    )
    ) else echo %%iΪU���̷�
    

  ) 
     
  
)


echo.
echo. 
echo ----------------------- ������ɣ� -----------------------
pause


