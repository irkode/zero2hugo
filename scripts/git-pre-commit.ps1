$Files = git diff --cached --name-only --diff-filter=ACMR
if (-Not $Files.Count) { exit 0 }

& npx prettier --ignore-unknown --check $Files
$Retval = $LastExitCode
if ($Retval) { Write-Error -ErrorAction Stop "Format Errors - Commit rejected"; exit $retval }
exit 0
