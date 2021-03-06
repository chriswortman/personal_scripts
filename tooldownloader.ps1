##Testing downloading from URLs##


$tempdir = $env:TEMP + "\Tools"
$url = "http://fakeurl.com/controlbox.ps1"
$output = $tempdir + "\controlbox.ps1"
$start_time = Get-Date
$outputtest = (Test-Path -path $output) | Out-String
$testpath = (Test-Path -Path $tempdir) | Out-String
#Verify Dir is created, create it if not. 

if ($outputtest -match "true") 
	{
	Remove-Item $output
}
if ($testpath -match "false" )
{
Write-Host "Tools DIR was not located, and will be created"
	New-Item -type directory -path $tempdir | Out-Null

}
else { }
#download the currator file from url.
(New-Object System.Net.WebClient).DownloadFile($url, $output)

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"  
Write-Output "File located in $output"

$testdl = (Test-Path -Path $output) | Out-String
if 
($testdl -match "true")
{Write-Host "Download Successful, Lauching Tools"
PowerShell.exe -ExecutionPolicy Bypass -File $output
}

else
{ Write-Host "Something went wrong" }

