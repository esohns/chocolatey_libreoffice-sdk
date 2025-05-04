$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '25.2.3'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/25.2.3/win/x86/LibreOffice_25.2.3_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/25.2.3/win/x86_64/LibreOffice_25.2.3_Win_x86-64_sdk.msi'
  checksum               = '98d125ec6a4b42a3a3ebcca98e06587e34b18ef35a9c2dcc66c07606d7c4807b'
  checksum64             = '36d971484e1218d6e4223a233f6c0bdcc7be95dd9c9458bb5e4dd9f91c5a6cf6'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
