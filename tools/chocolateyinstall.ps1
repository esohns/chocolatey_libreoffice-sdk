$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '25.2.5'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/25.2.5/win/x86/LibreOffice_25.2.5_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/25.2.5/win/x86_64/LibreOffice_25.2.5_Win_x86-64_sdk.msi'
  checksum               = '6853afd8476a12711bd28169019424552d7d546be3e2d834e45d0635494f9a18'
  checksum64             = '4046e870697614d3355c30a9d7f39b3112f0a7f3ec922dd51ab514dede774f10'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
