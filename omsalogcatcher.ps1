

## Dell OMSA Log grinder
$logs = Get-ChildItem -Path $Env:windir -Filter "lsi_*.log"
$tempdir = $env:TEMP + "\Tools"


### Tools Folder Creator

$outputtest = (Test-Path -path $tempdir) | Out-String

if ($outputtest -match "false" )
{
	## Write-Host "Tools Folder was not located, and will be created"
	New-Item -type directory -path $tempdir | Out-Null
	}

foreach ($log in $logs ) {
	Move-Item -Path $env:windir\$log -Destination $tempdir\$log -Force
	## Write-Host "Moved the following log to " $tempdir\$log
}


