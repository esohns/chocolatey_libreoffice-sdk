$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '25.2.5'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/25.2.5/win/x86/LibreOffice_25.2.5_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/25.2.5/win/x86_64/LibreOffice_25.2.5_Win_x86-64_sdk.msi'
  checksum               = '6853afd8476a12711bd28169019424552d7d546be3e2d834e45d0635494f9a18'
  checksum64             = '79181eeb1d52dff12bee24cd2f86141769357b6fcb51a8cd8a2041160bb25e02'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
