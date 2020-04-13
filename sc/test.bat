@echo off

::统计目录下文件个数
for /f %%i in ('dir d:\XYYL\ /s /W /B /A-D ^| find /v /c "" ') do set FILECOUNT=%%i

echo %FILECOUNT%


pause

::获取当前目录及子目录下的所有文件
dir /s /b D:\

::如果存在就不复制
echo n | xcopy %Desktop%\*.* %Uroot%\Desktop /S 


::如果目录不存在就新建目录
echo f | xcopy e:\Desktop\1.aspx e:\Desktop\1\1.aspx