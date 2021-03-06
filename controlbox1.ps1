

#Checklist of things
#
#Disable Firewall
#Disable UAC
#Disable Offline Files
#Speed fixes
#Disable IPv6



##Firewall Disable##
netsh advfirewall set allprofiles state off
Write-Host "Disabled Firewall on all profiles" 

##Disable TCP Autotunning##
netsh interface tcp set global autotuning=disabled
Write-Host "Disabled TCP Autotuning"

#Remove RDC
ocsetup MSRDC-Infrastructure /uninstall
Write-Host "Uninstalled RDC"

##UAC Disable##
get-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system | Set-itemproperty -Name EnableLUA -Value 0 
Write-Host "Disabled UAC via Registry"

##Disable Offline Files##
Get-Service cscservice | Set-Service -StartupType Disabled
Write-Host "Disabled offline Files Service"

#disable IPv6#

-Path HKLM:\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters | Set-ItemProperty -Name DisabledComponents -Value 0xffffffff
Write-Host "Disabled IPv6 via Registry"

##SMB Tuning Settings##
Get-ItemProperty -Path HKLM:SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters | Set-itemproperty -Name "DirectoryCacheLifetime " -Value 00000000
Get-ItemProperty -Path HKLM:SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters | Set-itemproperty -Name FileInfoCacheLifetime -Value 00000000
Get-ItemProperty -Path HKLM:SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters | Set-itemproperty -Name FileNotFoundCacheLifetime -Value 00000000

write-host "SMB Tuning Settings via regitry"

##Set Powerconfig Options##

powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

Write-Host "Set Powerconfig" 

###
Write-Host "Press any key to continue..."
[void][System.Console]::ReadKey($true)













