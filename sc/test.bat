@echo off

::ͳ��Ŀ¼���ļ�����
for /f %%i in ('dir d:\XYYL\ /s /W /B /A-D ^| find /v /c "" ') do set FILECOUNT=%%i

echo %FILECOUNT%


pause

::��ȡ��ǰĿ¼����Ŀ¼�µ������ļ�
dir /s /b D:\

::������ھͲ�����
echo n | xcopy %Desktop%\*.* %Uroot%\Desktop /S 


::���Ŀ¼�����ھ��½�Ŀ¼
echo f | xcopy e:\Desktop\1.aspx e:\Desktop\1\1.aspx