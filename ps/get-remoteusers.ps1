# Written by https://github.com/kmz27
$output1 = {
"------"
"Log created on:"
get-date -f "dd-MM-yyyy HH:mm"
get-localgroupmember remotedesktopbenutzer | select Name
}
& $output1 | Out-File -append \\{LOGPATH}\$env:computername.log -NoClobber


$output2 = {
    $Main = get-localgroupmember remotedesktopbenutzer | select Name, PrincipalSource
    foreach ($Users in $Main) {
        if ($Users.PrincipalSource -eq "ActiveDirectory") {
        "$(get-date -f 'dd-MM-yyyy HH:mm') $env:computername hat $(get-localgroupmember remotedesktopbenutzer | select Name)"
        }
    }
}
& $output2 | Out-File -append \\{LOGPATH}\all.log -NoClobber
