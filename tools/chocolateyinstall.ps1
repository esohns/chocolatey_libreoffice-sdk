$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '25.2.4'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/25.2.4/win/x86/LibreOffice_25.2.4_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/25.2.4/win/x86_64/LibreOffice_25.2.4_Win_x86-64_sdk.msi'
  checksum               = 'cd04cb94b6cd0bccfaa3b99e680f2c8b52f38c5ffc6b5a96843fc741f1ac4036'
  checksum64             = '85a73b6be35bb0260b5e1b85cd9d2de7a1437b3616536dc026dadd64f8169935'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
