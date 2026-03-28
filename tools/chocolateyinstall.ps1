$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '26.2.2'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/26.2.2/win/x86/LibreOffice_26.2.2_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/26.2.2/win/x86_64/LibreOffice_26.2.2_Win_x86-64_sdk.msi'
  checksum               = '4121d5e560d810cfc2a4215bd3743d24cd411af07f858af24a02962fc92de6ff'
  checksum64             = '3e9c1d68829a264cb10e640ec2d9efab98475675630b0e73553cfaab84424463'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

Install-ChocolateyPackage @packageArgs
