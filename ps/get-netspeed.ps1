# Written by https://github.com/kmz27
$SPEEED = {
"------"
"Log created on:"
get-date -f "dd-MM-yyyy HH:mm"
$Net = Get-WmiObject -Class Win32_NetworkAdapter | select Name, Speed, PhysicalAdapter
foreach ($Adapt in $Net) {
    if ($Adapt.PhysicalAdapter -eq $True -and $Adapt.Name -notlike '*Virtual*') {
        $Geschwindigkeit = [Int64]$Adapt.Speed / 1000 / 1000
        $Adapt.Name, 'Speed:', $Geschwindigkeit
    }
}
}
& $SPEEED | Out-File -append \\{LOGPATH}\$env:computername.log -NoClobber

$SLOW = {
$Net = Get-WmiObject -Class Win32_NetworkAdapter | select Name, Speed, PhysicalAdapter
foreach ($Adapt in $Net) {
    if ($Adapt.PhysicalAdapter -eq $True -and $Adapt.Name -notlike '*Virtual*') {
        $Geschwindigkeit = [Int64]$Adapt.Speed / 1000 / 1000
        if($Geschwindigkeit -lt 1000) {
        "$(get-date -f 'dd-MM-yyyy HH:mm') $env:computername an $($Adapt.Name) mit $Geschwindigkeit Mbit!"
        }
    }
}
}
& $SLOW | Out-File -append \\{LOGPATH}\all.log -NoClobber
