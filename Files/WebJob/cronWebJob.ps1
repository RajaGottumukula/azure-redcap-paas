#
# cronWebJob.ps1
#

$cronFile = "$($env:HOME)\site\wwwroot\cron.php"

$phpExe = "${env:ProgramFiles(x86)}\PHP\v7.3\php.exe"
Start-Process -NoNewWindow -FilePath $phpExe -ArgumentList @($cronFile)

