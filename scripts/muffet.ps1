Remove-Job -Name "HugoServer" -Force -ErrorAction SilentlyContinue
Remove-Job -Name "Muffet" -Force -ErrorAction SilentlyContinue
Get-Job
[void](Start-Job -Name "HugoServer" -ScriptBlock { hugo server -p 31169 })
[string[]]$hugo = Receive-Job -Name "HugoServer"
while ((-Not $Hugo) -or ($Hugo -and ($Hugo[-1] -ne "Press Ctrl+C to stop"))) {
   sleep -MilliSeconds 500
   $hugo = Receive-Job -Name "HugoServer"
}
$Muffet = Start-Job -Name "Muffet" -ScriptBlock { muffet /b 9192  /e "http://localhost:1313" http://localhost:31169/zero2hugo/; if ($LastExitCode) { throw "failed" } }
$Muffet = Start-Job -Name "Muffet" -ScriptBlock { muffet /b 9192  /e "http://blocalhost:1313" http://localhost:31169/zero2hugo/; if ($LastExitCode) { throw "failed" } }
$status = Wait-Job -Job $Muffet
$result = Receive-Job -Job $Muffet -Wait -AutoRemoveJob
If ($status.State -ne "Completed") {
   "------------------------------" | Out-Host
   $result | Out-Host 
   "------------------------------" | Out-Host
   Write-Error "Link checks failed"
}
Remove-Job -Name "HugoServer" -Force -ErrorAction SilentlyContinue
Remove-Job -Name "Muffet" -Force -ErrorAction SilentlyContinue
exit 0
