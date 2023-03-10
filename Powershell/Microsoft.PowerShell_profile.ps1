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
	cd $HOME/OneDrive/Documents/
}

function nvc {
	cd $env:LOCALAPPDATA/nvim/
}

function fvim {
  nvim $(fzf  --pointer=' ' --border --info=inline --prompt='▶ ' --color=fg+:#000000,bg+:#FF0000,gutter:-1 --exact)
}

function fopen {
	Start-Process $(fzf  --pointer=' ' --border --info=inline --prompt='▶ ' --color=fg+:#000000,bg+:#FF0000,gutter:-1 --exact)
}

function fcd {
	cd (fd --type directory | fzf  --pointer=' ' --border --info=inline --prompt='▶ ' --color=fg+:#FFFFFF,bg+:#FF0000,gutter:-1 --exact)
}

function fcode {
	code (fd --type directory | fzf  --pointer=' ' --border --info=inline --prompt='▶ ' --color=fg+:#000000,bg+:#FF0000,gutter:-1 --exact )
}

# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

$env:PATH+=";C:\Users\jayde\AppData\Local\setproxy"
