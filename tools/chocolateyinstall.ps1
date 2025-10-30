$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '25.8.2'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/25.8.2/win/x86/LibreOffice_25.8.2_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/25.8.2/win/x86_64/LibreOffice_25.8.2_Win_x86-64_sdk.msi'
  checksum               = '67d086073d4aeb56213f6091f06394e53cc9f0fda9dd7abdf8358a069609988d'
  checksum64             = 'c4132cd03074893fc8285d4b9a2d35533a73b4ff9f56d407d3ababd8fc20a13e'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
