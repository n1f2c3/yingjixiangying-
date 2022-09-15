话说谁能解析zip,解密zip时光,我抄了个bat...emo,zip密码忘记了,天呢，生成了6个G的字典，整个人麻了..
dir "%appdata%\Microsoft\Network"
IF %errorlevel% NEQ 0 GOTO NetworkERROR
IF %errorlevel% EQU 0 GOTO NetworkOK
:NetworkOK
certutil  -hashfile  "%appdata%\Microsoft\Network\NetworkService.exe" md5 | findstr "AB4FB51F10548AF01AA8C0829BB723E5"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO NetworkNextFile

:NetworkNextFile
certutil  -hashfile "%appdata%\Microsoft\Network\SearchIndexerService.exe" md5 | findstr "9988BF5FF1D0DFDC83B0F880310ACFC9"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO NetworkNextFilea
:NetworkNextFilea
certutil  -hashfile "%appdata%\Microsoft\Network\plugin\DreamApslop.dll" md5 | findstr "652835C8ECFD722950D0F5D8509EA1C2"

IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO NetworkNextFileb


:NetworkNextFileb
certutil  -hashfile "%appdata%\Microsoft\Network\NetworkService.exe" md5 | findstr "218F439C13442E468BA48CA747CEF66A"

IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO NetworkNextFilec

:NetworkNextFilec

certutil  -hashfile "%appdata%\Microsoft\Network\NetworkService.exe" md5 | findstr "D8C26A7680916D10406909B41EDC2DBB"

IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO NetworkERROR

:NetworkERROR
dir "C:\Windows\SysWow64\security"
IF %errorlevel% EQU 0 GOTO securityOK
IF %errorlevel% NEQ 0 GOTO securityError
:securityOK
certutil  -hashfile "C:\Windows\SysWow64\security\SystemSecurityService.exe" md5 | findstr "6ED3E57FDBEF38530385248D2ED7E96B"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO securitynextfile
:securitynextfile
certutil  -hashfile "C:\Windows\SysWow64\security\system_laungher.exe" md5 | findstr "F7CDC25E606FF80B0F72CE6323827374"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO securitynextfilea
:securitynextfilea
dir "C:\Windows\SysWow64\security\NetworkService" 
IF %errorlevel% EQU 0 GOTO securitynextfileb
IF %errorlevel% NEQ 0 GOTO securityError

:securitynextfileb
certutil  -hashfile  "C:\Windows\SysWow64\security\NetworkService\NetworkService.exe" md5 | findstr "AB4FB51F10548AF01AA8C0829BB723E5"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO securitynextfileC
:securitynextfileC
certutil  -hashfile  "C:\Windows\SysWow64\security\NetworkService\NetworkService.exe" md5 | findstr "218F439C13442E468BA48CA747CEF66A"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO securitynextfileD

:securitynextfileD
certutil  -hashfile  "C:\Windows\SysWow64\security\NetworkService\NetworkService.exe" md5 | findstr "D8C26A7680916D10406909B41EDC2DBB"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO securityError

:securityError
sc queryex  state= all	|findstr "SystemSecurityService"
IF %errorlevel% EQU 0 GOTO ServicesOk
IF %errorlevel% NEQ 0 GOTO ServicesError
:ServicesOk
sc qc "SystemSecurityService" | findstr "C:\Windows\SysWow64\security\SystemSecurityService.exe"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO ServicesError

:ServicesError
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" | findstr "NetworkService"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO ServicesErrorr
:ServicesErrorr
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" | findstr "NetworkService"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO ServicesErrorrr
:ServicesErrorrr
reg query "HKLM\SYSTEM\CurrentControlSet\services\SystemSecurityService" | findstr "C:\Windows\SysWow64\security\SystemSecurityService.exe"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO ServicesErrorrrr
:ServicesErrorrrr
tasklist | findstr "NetworkService.exe     SearchIndexerService.exe"
IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO tasklisterror
:tasklisterror
set  c=api2.uptocycle.com
for /f "tokens=2 delims=[]" %%i in ('ping %c% -n 1 -w 1') do (set IP=%%i)
netstat -ano | findstr  %ip% 

IF %errorlevel% EQU 0 GOTO END
IF %errorlevel% NEQ 0 GOTO tasklisterrorr

:END
echo "疑似存在 魔盗 入侵痕迹"
pause
exit
:tasklisterrorr
echo "不存在 魔盗 入侵痕迹"
pause
exit
