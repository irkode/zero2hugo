param(
   [switch]$local,
   [switch]$rm
)


if ($local) {
   if ($rm -and (Test-Path ./public)) { remove-item -Recurse ./public_local }
   & hugo `
      --cleanDestinationDir --gc `
      --logLevel debug `
      --baseURL http://localhost:8000/zero2hugo `
      --printPathWarnings `
      --printUnusedTemplates `
      --destination .\public_local\zero2hugo `

}
else {
   if ($rm -and (Test-Path ./public)) { remove-item -Recurse ./public }

   & hugo `
      --cleanDestinationDir --gc `
      --logLevel debug `
      --printPathWarnings `
      --printUnusedTemplates
}
