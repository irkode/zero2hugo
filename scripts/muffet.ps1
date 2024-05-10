Remove-Job -Name "HugoServer" -Force -ErrorAction SilentlyContinue
Remove-Job -Name "Muffet" -Force -ErrorAction SilentlyContinue
Get-Job
Write-Output "Starting HugoServer Port 31169"
[void](Start-Job -Name "HugoServer" -ScriptBlock { hugo server -p 31169 })
[string[]]$hugo = Receive-Job -Name "HugoServer"
while ((-Not $Hugo) -or ($Hugo -and ($Hugo[-1] -ne "Press Ctrl+C to stop"))) {
   sleep -MilliSeconds 500
   $hugo = Receive-Job -Name "HugoServer"
}
$muffet_time = Measure-Command {
   $Muffet = Start-Job -Name "Muffet" -ScriptBlock { muffet /b 9192  /e "http://localhost:1313" http://localhost:31169/zero2hugo/; if ($LastExitCode) { throw "failed" } }
   $status = Wait-Job -Job $Muffet
}
Write-Host "Muffet Link checks done in $muffet_time"
$result = Receive-Job -Job $Muffet -Wait -AutoRemoveJob
If ($status.State -ne "Completed") {
   "------------------------------" | Out-Host
   $result | Out-Host 
   "------------------------------" | Out-Host
   Write-Error "Link checks failed"
}
Remove-Job -Name "HugoServer" -Force -ErrorAction SilentlyContinue
Remove-Job -Name "Muffet" -Force -ErrorAction SilentlyContinue
Get-Job
exit 0
