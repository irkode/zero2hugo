$Files = git diff --cached --name-only --diff-filter=ACMR
if (-Not $Files.Count) { exit 0 }

$MarkdownFiles = $Files | Where-Object { $_ -like '*.md' } 

"Files: " | Out-Host
$Files | Out-Host
"-------------------------------------" | Out-Host
"MarkdownFiles: " | Out-Host
$MarkdownFiles | Out-Host
"-------------------------------------" | Out-Host

$Checks = 0
$ChecksFailed = 0

$Checks += 1
"########## prettier " | Out-Host
& npx prettier --ignore-unknown --check $Files
If ($LastExitCode) {
   $ChecksFailed += 1
   Write-Error -ErrorAction Continue "Format Errors - Commit rejected";
}
else {
   Write-Output "Formatting OK";
}

$Checks += 1
"########## cspell " | Out-Host
if ($MarkdownFiles.Count) {
   & npx cspell $MarkdownFiles
   If ($LastExitCode) {
      $ChecksFailed += 1
      Write-Error -ErrorAction Continue "Format Errors - Commit rejected";
   }
}
else {
   Write-Output "Spelling   SKIPPED - no Markdown Files changed";
}

if ($ChecksFailed) { 
   Write-Error -ErrorAction Stop "FAILURE: $ChecksFailed of $Checks failed - Commit rejected"
   exit 1
}
else {
   Write-Output "SUCCESS: Static $checks Checks successfull"
}

exit 0
