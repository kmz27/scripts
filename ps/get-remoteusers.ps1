# Written by https://github.com/kmz27
$output = {
"Log created on:"
get-date -f "dd-MM-yyyy HH:mm"
get-localgroupmember remotedesktopbenutzer | select Name}
& $output | Out-File -append \\{LOGPATH}\$env:computername.log -NoClobber
