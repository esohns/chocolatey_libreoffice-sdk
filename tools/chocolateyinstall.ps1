$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '25.8.4'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/25.8.4/win/x86/LibreOffice_25.8.4_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/25.8.4/win/x86_64/LibreOffice_25.8.4_Win_x86-64_sdk.msi'
  checksum               = 'c4f5c4a34f844aa3b314df5d563d4dbd3c9f0f3f6c73ef9a2fb0ebf3f2180907'
  checksum64             = 'fae6165dfcedf378e40c5ebb4df4d622b28bf1d15ba3faac09aa3ca1085bdb75'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
