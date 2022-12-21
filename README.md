## Things to install:

1. [Powershell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3)
2. [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
3. [choco](https://chocolatey.org/install)
4. [scoop](https://scoop.sh/) * 
5. [Windows Terminal](https://github.com/microsoft/terminal)
6. [Oh My Posh](https://ohmyposh.dev/docs/)
7. [Microsoft Powertoys](https://github.com/microsoft/PowerToys)

PS: I had some problems installing scoop using IWR/IRM. For some reason JioFiber's default DNS server was unable
to resolve `raw.githubusercontent.com`. The fix was to change the DNS server in your computer manually to Google's
DNS server(8.8.8.8). See [this](https://github.com/orgs/community/discussions/32889#discussioncomment-4320144) and [this](https://www.windowscentral.com/how-change-your-pcs-dns-settings-windows-10)


## What is Inside?

1. A Proxy Manager for git and npm(currently only these are supported. But `scripts/setproxy.ps1` can be modified according to your needs).

#### To use:

First make sure you have [MinGW(Cygwin)](https://cygwin.com/) installed.

Then, copy `scripts/setproxy.ps1` to a directory of your choice. Add that directory to the `$PATH` and restart Powershell for the changes to
take effect.

Commands:
```
`setproxy hostel` -> Sets proxy for git/npm to 172.16.199.40:8080
`setproxy library` -> Sets proxy for git/npm to 172.16.199.20:8080
`setproxy h9` -> Sets proxy for git/npm to 172.16.199.41:8080
`setproxy unset` -> unsets all proxies
`setproxy` -> Interactive Proxy selection
```
