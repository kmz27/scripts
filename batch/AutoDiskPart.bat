@echo off
title DiskPart
color 0b
(echo Rescan
echo List Disk
)  | diskpart

echo Enter Disk Number
set /p "name="
cls
(echo List Disk
echo Select Disk %name%
)  | diskpart

color c0
set "reply=y"
set /p "reply=Continiue with REMOVING ALL DATA from this disk? Proceeding will result in irreversible data loss! [y|n]:"
if /i not "%reply%" ==  "y" goto :skip
(echo Select Disk %name%
echo clean
echo convert GPT
echo create partition primary
echo format fs=exfat quick
)  | diskpart

cls
color 0a
echo DONE! Press any key to exit the application. Else it will terminate in 10 seconds.
timeout /t 10
exit

:skip
cls
color 0e
echo Canceled all data wipe! No harm was done to your files.
echo Press any key to exit the application. Else it will terminate in 10 seconds.
timeout /t 10
exit