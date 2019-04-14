@echo off
title WIN10更新助手 - Lovingly Made By [杨元] :-D
mode con cols=71 lines=14
color 5f

echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※                                                                  ※
echo ※              ☆★ Windows10系统自动更新管理工具 ★☆             ※
echo ※                                                                  ※
echo ※                     请先退出360等安全管家！                      ※
echo ※             请确认右键选择"以管理员身份运行"此脚本！             ※
echo ※                                                                  ※
echo ※                           作者〖杨元〗                           ※
echo ※  帮助与反馈〖https://www.cnblogs.com/iyangyuan/p/10555073.html〗 ※
echo ※                                                                  ※
echo ※                           按任意键继续                           ※
echo ※                                                                  ※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
pause > nul

set wuaueng=C:\Windows\System32\wuaueng.dll

:menu
cls
echo.
echo.
echo --[1]--屏蔽Windows10系统更新
echo --[2]--恢复Windows10系统更新
echo --[3]--退出程序
echo.
echo.
echo.
echo --注意--屏蔽成功后请不要删除本程序！否则无法恢复！！！ x_x
echo.
echo.
echo.
choice /c 123 /n /m "请选择【1-3】："

echo %errorlevel%
if %errorlevel% == 1 goto disable
if %errorlevel% == 2 goto enable
if %errorlevel% == 3 goto end
else (goto menu)

:disable
takeown /f %wuaueng%
icacls %wuaueng% /grant "%USERDOMAIN%\%USERNAME%":(F)
copy %wuaueng% %~dp0duplicate
break>%wuaueng%

cls
echo.
echo.
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※                                                                  ※
echo ※    成功屏蔽Windows10系统更新！妈妈再也不用担心电脑自动重启啦~    ※
echo ※                                                                  ※
echo ※      〖再次郑重提醒〗【！请不要删除本程序，否则无法恢复！】      ※
echo ※                                                                  ※
echo ※                         按任意键退出程序                         ※
echo ※                                                                  ※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo.
echo.
pause > nul
exit

:enable
if not exist %~dp0duplicate goto noduplicate
takeown /f %wuaueng%
icacls %wuaueng% /grant "%USERDOMAIN%\%USERNAME%":(F)
del /f /q %wuaueng%
copy %~dp0duplicate %wuaueng%

cls
echo.
echo.
echo.
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※                                                                  ※
echo ※         成功恢复Windows10系统更新！赶快去升级你的系统吧~         ※
echo ※                                                                  ※
echo ※                         按任意键退出程序                         ※
echo ※                                                                  ※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo.
echo.
echo.
pause > nul
exit

:noduplicate
cls
echo.
echo.
echo.
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo ※                                                                  ※
echo ※                          ☆★ 警告 ★☆                          ※
echo ※                                                                  ※
echo ※        程序检测到您从未屏蔽过Windows10系统更新，无需恢复！       ※
echo ※                                                                  ※
echo ※                         按任意键退出程序                         ※
echo ※                                                                  ※
echo ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
echo.
echo.
pause > nul
exit

:end
exit


