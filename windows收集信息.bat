@echo off

::后续有时间就补充


::这是注释吗？
::for循环样例   for  %i in (AVC,ASDA)   do echo %i
echo "注释" 
mkdir C:\tmpxxxxxx


::操作注册表测试判断注册表是否存在
@echo off

::reg query "HKEY_CURRENT_USER\Console" 
::reg query "HKEY_CURRENT_USER\Console" /ve 2>nul | findstr "! REG.EXE VERSION 3.0"  > nul
::if  not %errorlevel% leq 0 (
::echo 不存在
::) else (
::echo 存在
::)
:::end

::针对隐藏用户的查看,暂时只能是net user$的方式查看
::查看用户名和密码
echo "计算机版本"
wmic os get caption,csdversion,version   >  C:\tmpxxxxxx\计算机版本.txt
echo "管理员用户组"
net localgroup administrators  > C:\tmpxxxxxx\管理员用户组.txt
echo "普通成员用户组"
net localgroup Users  >  C:\tmpxxxxxx\普通成员用户.txt
echo "网络状态检查"
netstat -ano >  C:\tmpxxxxxx\网络状态.txt
echo "进程信息检查"
tasklist  >  C:\tmpxxxxxx\CMD进程信息.txt
echo "路由信息检查"
route print > C:\tmpxxxxxx\本地路由表信息.txt
echo "arp表检查"
arp -a  > C:\tmpxxxxxx\arp表信息.txt
echo "操作系统信息，补丁信息检查"
systeminfo  〉 C:\tmpxxxxxx\系统信息补丁信息.txt
echo "已启动服务检查"
net start  >  C:\tmpxxxxxx\已启动服务.txt
echo "所有服务名备份"
sc query state= all   >  C:\tmpxxxxxx\所有服务名称.txt
echo "共享信息"
net share >  C:\tmpxxxxxx\共享信息.txt
echo "注册表启动项检查"
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run & reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run >C:\tmpxxxxxx\注册表启动项检查.log

echo "安全策略检查"

secedit /export /cfg LocalGroupPolicy&type LocalGroupPolicy >  C:\tmpxxxxxx\安全策略.txt

 
echo "添加和卸载记录"
reg query HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\UNINSTALL /s /v DisPlayname > C:\tmpxxxxxx\添加和卸载记录.log

echo "CMD记录"
reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU >  C:\tmpxxxxxx\CMD记录.log

echo "文件执行记录"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher  > C:\tmpxxxxxx\文件执行记录.txt
echo "文件记录检查"
reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths >  C:\tmpxxxxxx\文件记录检查.txt
echo "文件记录检查2"
reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\* /v *   > C:\tmpxxxxxx\文件记录检查2.txt
echo "进程创建日志"
wevtutil qe security /rd:true /f:text /q:"Event[System[(EventID=4688)]]"    〉  C:\tmpxxxxxx\进程创建信息.txt


::ShimCacheParser.py -o out.csv -r c:\test\ShimCache.reg -t

echo "ShimCache收集，记录产生的兼容型问题"
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache"  "C:\tmpxxxxxx\ShimCache.reg"


echo "UserAssist"

reg  query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist   〉C:\tmpxxxxxx\UserAssist.txt

echo "https://3gstudent.github.io/%25E6%25B8%2597%25E9%2580%258F%25E6%258A%2580%25E5%25B7%25A7-Windows%25E7%25B3%25BB%25E7%25BB%259F%25E6%2596%2587%25E4%25BB%25B6%25E6%2589%25A7%25E8%25A1"  >>  C:\tmpxxxxxx\UserAssist.txt


echo "MUICache"
reg query "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" >  C:\tmpxxxxxx\MUICache.txt

echo "程序执行记录"
reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"  >  C:\tmpxxxxxx\程序执行记录.txt

reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" >> C:\tmpxxxxxx\程序执行记录.txt
reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Persisted" >> C:\tmpxxxxxx\程序执行记录.txt
reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store"  >>  C:\tmpxxxxxx\程序执行记录.txt


echo "Prefetch"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher  > C:\tmpxxxxxx\Prefetch.txt

echo "Amcache"

echo "https://3gstudent.github.io/%25E6%25B8%2597%25E9%2580%258F%25E6%258A%2580%25E5%25B7%25A7-Windows%25E7%25B3%25BB%25E7%25BB%259F%25E6%2596%2587%25E4%25BB%25B6%25E6%2589%25A7%25E8%25A1%258C%25E8%25AE%25B0%25E5%25BD%2595%25E7%259A%2584%25E8%258E%25B7%25E5%258F%2596%25E4%25B8%258E%25E6%25B8%2585%25E9%2599%25A4/+&cd=1&hl=zh-CN&ct=clnk&gl=us"  > C:\tmpxxxxxx\Amcache.txt



echo "开始查看cmd历史"
doskey /history  >  C:\tmpxxxxxx\cmdhistory.txt


echo "开始拷贝系统日志"
mkdir  "C:\tmpxxxxxx\系统日志"
xcopy %SystemRoot%\System32\Winevt\Logs\*.*   C:\tmpxxxxxx\系统日志   /s /e




mkdir C:\tmpxxxxxx\注册表
reg export HKLM  C:\tmpxxxxxx\注册表\hklm.reg > nul
reg export HKCU C:\tmpxxxxxx\注册表\hkcu.reg > nul
reg export HKCR C:\tmpxxxxxx\注册表\hkcr.reg > nul
reg export HKU  C:\tmpxxxxxx\注册表\hku.reg > nul
reg export HKCC C:\tmpxxxxxx\注册表\hkcc.reg > nul

echo "注册表备份成功"
回收站、浏览器保存记录、https://github.com/TonyPhipps/Meerkat

pause

