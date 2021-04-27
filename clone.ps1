Write-host ""
Write-host "Required git installed!" -ForegroundColor Red
Write-host ""
Write-host "Example:"
Write-host "Destination directory + folder: C:/nameFolder"
Write-host "Repository root URL: https://github.com/pdrodavi/teste"
Write-host "Name of the subdirectory to be cloned: clone"
Write-host ""

# Banner
Write-host "  ___               Clone qualquer repositorio          _ _   _      " -ForegroundColor Green
Write-host
Write-host "  ------------------------- by @pdrodavi --------------------------  " -ForegroundColor Green

Write-host

$path = Read-Host "Destination directory + folder"
$url = Read-Host "Repository root URL"
$sub = Read-Host "Name of the subdirectory to be cloned"

New-Item -Path $path -ItemType directory

cd $path

git init
git remote add -f origin $url
git config core.sparseCheckout true

Set-Content .git\info\sparse-checkout $sub"/*" -Encoding Ascii

git pull origin master

echo "Successfully cloned!"

start $path

pause