
## Download/extract Node + NPM.  Add Node to PATH
$InstallDir = "C:\users\alexb\NodeJs"
$NodeDir = "$InstallDir\node-v16.18.1-win-x64"
$NodeTemp = "$InstallDir\temp\node-v16.18.1-win-x64.zip"

$nodeJsUri = "https://nodejs.org/download/release/v16.18.1/node-v16.18.1-win-x64.zip"

Invoke-WebRequest -Uri $nodeJsUri -OutFile (New-Item -Path $NodeTemp -force)
Expand-Archive  -Path $NodeTemp -DestinationPath $InstallDir

$Path = [Environment]::GetEnvironmentVariable("PATH", "User") + [IO.Path]::PathSeparator + $Path
[Environment]::SetEnvironmentVariable("PATH", $NodeDir, "User" )

#reload path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Set-Location $NodeDir

## Installing Gulp, Yeoman, and Yeoman SP Gen
npm install gulp-cli --global
npm install yo --global
npm install @microsoft/generator-sharepoint --global

#gulp trust-dev-cert

#