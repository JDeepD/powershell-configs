$unset = New-Object System.Management.Automation.Host.ChoiceDescription '&unset', ''

$JsonProfiles = Get-Content -Raw proxyservers.json | ConvertFrom-Json

[System.Management.Automation.Host.ChoiceDescription[]]$options = ($unset)

forEach($profile in $JsonProfiles.profiles){
	$options += New-Object System.Management.Automation.Host.ChoiceDescription $profile.name, ($profile.proxyserver + ":" + $profile.proxyport)
}

function setproxy($proxyserver){
		Write-Output 'Setting Proxy to' $proxyserver;
		Write-Output 'Setting git proxy...';
		git config --global http.proxy $proxyserver;
		git config --global https.proxy $proxyserver;
		Write-Output 'Done...';
		Write-Output 'Setting npm proxy...';
		npm config set proxy $proxyserver;
		Write-Output 'Done...';
}

function unsetproxy{
		Write-Output 'Unsetting git proxy vars...';
		git config --global --unset http.proxy;
		git config --global --unset https.proxy;
		Write-Output 'Done...';
		Write-Output 'Unsetting npm proxy vars...'
		npm config rm proxy;
		Write-Output 'Done...';
}

function setproxyinteractive{
	$title = 'Select Proxy Server: '
	$message = 'Configure Proxies for: npm, git'
	$result = $host.ui.PromptForChoice($title, $message, $options, 0)
	if($result -eq 0){
		unsetproxy;
	} 
	elseif($result -in 1..$options.count){
		setproxy($options[$result].HelpMessage)
	}
}

$table = @{
	"hostel" = "http://172.16.199.40:8080"
	"library" = "http://172.16.199.20:8080"
	"h9" = "http://172.16.199.41:8080"
}

$argv=$args[0]

if($argv -eq "unset"){
	unsetproxy;
}
elseif($argv -in $table.Keys){
	setproxy($table[$proxyserver])
}
elseif($argv -eq "list"){
	Write-Output $table;
}
else{
	Write-Output "No proxy server found. Choose from below: ";
	setproxyinteractive;
}
