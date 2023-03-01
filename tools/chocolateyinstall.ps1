$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. $toolsDir\helpers.ps1

$packageArgs = @{
  packageName            = 'libreoffice-sdk'
  version                = '7.5.0'
  fileType               = 'msi'
  url                    = 'https://download.documentfoundation.org/libreoffice/stable/7.5.0/win/x86/LibreOffice_7.5.0_Win_x86_sdk.msi'
  url64bit               = 'https://download.documentfoundation.org/libreoffice/stable/7.5.0/win/x86_64/LibreOffice_7.5.0_Win_x86-64_sdk.msi'
  checksum               = '87153f4593826e7650f790da07603cb90ac3e9a1d23e178f4ec59f29a1a50d05'
  checksum64             = '92a0485901a8b772cfc6788f3a87d32ad6d373b7f8ea153aa8ba2b8fed6830d2'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /passive /norestart /l*v "{0}"' -f "$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log"
  validExitCodes         = @(0,3010)
  softwareName           = 'LibreOffice SDK*'
}

if (-not (IsUrlValid $packageArgs.url)) {
  $exactVersion = GetLibOExactVersion $packageArgs.version
  $packageArgs.url = $exactVersion.Url32
  $packageArgs.url64bit = $exactVersion.Url64
}

Install-ChocolateyPackage @packageArgs
