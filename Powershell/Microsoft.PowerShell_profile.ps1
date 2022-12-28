oh-my-posh init pwsh --config 'C:\Users\jayde\AppData\Local\Programs\oh-my-posh\themes\tiwahu.omp.json' | Invoke-Expression

Set-Alias -Name c -Value clear
Set-Alias -Name code -Value code`-insiders

function profile {
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

function src {
	. $PROFILE
}

function fopen {
	Start-Process $(fzf --exact)
}

function fcd {
	cd (fd --type directory | fzf --exact)
}

# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})
