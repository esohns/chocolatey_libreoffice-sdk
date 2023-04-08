$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '7.5.2'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/7.5.2/win/x86/LibreOffice_7.5.2_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/7.5.2/win/x86_64/LibreOffice_7.5.2_Win_x86-64_sdk.msi'
  checksum               = '24688363d14550930fa8fd928470ece04e5ba12238cfc3315c5ccebb34c676e9'
  checksum64             = 'f7c8331263a55f280f3d6ca6f2f3b614be6e70ee811e8d7b9aa6e7ed2f8230b3'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
