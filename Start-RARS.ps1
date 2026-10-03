$ErrorActionPreference = 'Stop'
$java = Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'tools\java') -Filter javaw.exe -Recurse | Select-Object -First 1 -ExpandProperty FullName
if (-not $java) { throw 'Portable Java not found in tools/java' }
Start-Process -FilePath $java -ArgumentList @('-jar', ('"' + (Join-Path $PSScriptRoot 'tools\rars.jar') + '"')) -WorkingDirectory $PSScriptRoot -WindowStyle Hidden
