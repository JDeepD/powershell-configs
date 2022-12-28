## Things to install:

1. [Powershell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3)
2. [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
3. [choco](https://chocolatey.org/install)
4. [scoop](https://scoop.sh/) * 
5. [Windows Terminal](https://github.com/microsoft/terminal)
6. [Oh My Posh](https://ohmyposh.dev/docs/)
7. [Microsoft Powertoys](https://github.com/microsoft/PowerToys)

## Optional (for Neovim plugins)
1. [Lazygit](https://github.com/jesseduffield/lazygit#scoop-windows)
2. [fd](https://github.com/sharkdp/fd)
3. [pynvim](https://github.com/neovim/pynvim)
4. [npm](https://github.com/npm/cli)
5. [MingW build chain](https://community.chocolatey.org/packages/mingw)

PS: I had some problems installing scoop using IWR/IRM. For some reason JioFiber's default DNS server was unable
to resolve `raw.githubusercontent.com`. The fix was to change the DNS server in your computer manually to Google's
DNS server(8.8.8.8). See [this](https://github.com/orgs/community/discussions/32889#discussioncomment-4320144) and [this](https://www.windowscentral.com/how-change-your-pcs-dns-settings-windows-10)


## What is Inside?

1. A Proxy Manager for git and npm(currently only these are supported. But `scripts/setproxy.ps1` can be modified according to your needs).

## To use:

First make sure you have [MinGW(Cygwin)](https://cygwin.com/) installed.

Then, copy `scripts/setproxy.ps1` to a directory of your choice. Add that directory to the `$PATH` and restart Powershell for the changes to
take effect.

## Commands:

#### Create a profile
```
setproxy create
```
#### Show all profiles 
```
setproxy list
```
#### Switch to a profile by nickname 
```
setproxy <nickname>
```
#### Interactive Proxy switching 
```
setproxy
```
#### Unset all proxies
```
setproxy unset
```
