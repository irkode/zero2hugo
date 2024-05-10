param(
   [string]$port = 1313,
   [switch]$rm
)

if ($rm -and (Test-Path ./public)) { remove-item -Recurse ./public }


write-Host "Server $port"
& hugo server --cleanDestinationDir --gc --logLevel debug --disableFastRender --printPathWarnings --printUnusedTemplates -p $port
