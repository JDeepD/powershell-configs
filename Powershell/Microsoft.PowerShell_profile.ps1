oh-my-posh init pwsh --config 'C:\Users\jayde\AppData\Local\Programs\oh-my-posh\themes\tiwahu.omp.json' | Invoke-Expression

Set-Alias -Name c -Value clear
Set-Alias -Name code -Value code`-insiders
Set-Alias -Name vim -Value neovide
Set-Alias -Name ~ -Value $HOME


function pr {
	nvim $PROFILE
}

function init.lua {
	nvim $env:LOCALAPPDATA/nvim/init.lua
}

function plugins {
	nvim $env:LOCALAPPDATA/nvim/lua/core/plugins.lua
}

function win10 {
	Set-Location $HOME/OneDrive/Documents/
}

function nvc {
	Set-Location $env:LOCALAPPDATA/nvim/
}

function fvim {
  $file=$(fzf  --pointer=' ' --border --info=inline --prompt='▶ ' --color=fg+:#FFFFFF,bg+:#FF0000,gutter:-1 --exact --preview "bat --style=numbers --color=always --line-range :500 {}")
  if ($file){
    nvim $file
  }
}

function fcp {
  $from=$(fd | fzf  --pointer=' ' --border --info=inline --prompt='(Select file to copy) ▶ ' --color=fg+:#FFFFFF,bg+:#FF0000,gutter:-1 --exact)
  $to=$(fd --type directory | fzf  --pointer=' ' --border --info=inline --prompt='(Select directory to paste) ▶ ' --color=fg+:#FFFFFF,bg+:#FF0000,gutter:-1 --exact)

  if($from && $to){
    Write-Host "Copying from: $from"
    Write-Host "Pasting to: $to"
    Copy-Item $from $to -Recurse
    Write-Host "Done"
  }else{
    Write-Host "Missing from or to params..."
  }
}

function fopen {
  $file=$(fzf  --pointer=' ' --border --info=inline --prompt='▶ ' --color=fg+:#FFFFFF,bg+:#FF0000,gutter:-1 --exact)
  if($file){
    Start-Process $file
  }
}

function fcd {
	Set-Location (fd --type directory | fzf  --pointer=' ' --border --info=inline --prompt='▶ ' --color=fg+:#FFFFFF,bg+:#FF0000,gutter:-1 --exact)
}

function fcode {
  $dir=$(fd --type directory | fzf  --pointer=' ' --border --info=inline --prompt='▶ ' --color=fg+:#FFFFFF,bg+:#FF0000,gutter:-1 --exact)
	if($dir){
      code $dir
  }
}

# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

$env:PATH+=";C:\Users\jayde\AppData\Local\setproxy"
