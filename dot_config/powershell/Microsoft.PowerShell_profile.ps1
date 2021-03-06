#!/usr/bin/env pwsh

# Use UTF-8 everywhere
$OutputEncoding = [Console]::InputEncoding = [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$ENV:PATH += ":~/bin:~/.local/bin:~/.cargo/bin"
$ENV:EDITOR="micro"
$ENV:VISUAL="code --wait"

$ENV:CFLAGS="${CFLAGS} -march=native -O2 -pipe"
$ENV:CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
$ENV:RUSTFLAGS="-Ctarget-cpu=native"
$ENV:PYTHONIOENCODING='UTF-8'

$ENV:LANG='de_DE.UTF-8'
$ENV:LC_ALL='de_DE.UTF-8'
$ENV:LC_TIME='ja_JP.UTF-8'

Set-Alias -Name ls -Value "lsd"
function l { lsd -l $args }
function la { lsd -lA $args }
function tree { lsd --tree $args }
Set-Alias -Name vi -Value "nvim"
Set-Alias -Name vim -Value "nvim"

Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

if (!$isWindows) {
  Import-Module Microsoft.PowerShell.UnixCompleters
}

&~/.cargo/bin/lolcow-fortune cowsay -fmoose -L
&starship init powershell --print-full-init | Out-String | Invoke-Expression
