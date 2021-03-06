﻿# Set the standard 4 parameters
$packageName = '{{PackageName}}'
$fileType = 'exe'
$LCID = (Get-Culture).LCID
$silentArgs = "/S /L=$LCID"
# Please test every new version of Speccy for possible adware/spyware/crapware which installs silently together with Piriform software products.
# Only push the new package to the gallery if you are 100 % sure that this package prevents the install of the bundled adware.
$url = '{{DownloadUrl}}'
$regAdd = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\regAdd.ps1"

# This adds a registry key which prevents Google Chrome from getting installed together with Piriform software products.
Start-ChocolateyProcessAsAdmin "& `'$regAdd`'"

Install-ChocolateyPackage $packageName $fileType $silentArgs $url
