$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '24.2.3'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/24.2.3/win/x86/LibreOffice_24.2.3_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/24.2.3/win/x86_64/LibreOffice_24.2.3_Win_x86-64_sdk.msi'
  checksum               = '752e9893c5a74c40ac9352d06637fb23155219b311c1081c06afae65b2ff1fe6'
  checksum64             = '2cb770edbf759108b02642ab5d8f2b6f114de4e25309e9c6f09b2f8f268470d4'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
