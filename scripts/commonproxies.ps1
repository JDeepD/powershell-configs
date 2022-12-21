$hostel = New-Object System.Management.Automation.Host.ChoiceDescription '&hostel', 'http://172.16.199.40:8080'
$lib = New-Object System.Management.Automation.Host.ChoiceDescription '&library', 'http://172.16.199.20:8080'
$h9 = New-Object System.Management.Automation.Host.ChoiceDescription '&hostel9', 'http://172.16.199.41:8080'
$unset = New-Object System.Management.Automation.Host.ChoiceDescription '&unset', ''

$options = [System.Management.Automation.Host.ChoiceDescription[]]($hostel, $lib, $h9, $unset)

$title = 'Select Proxy Server: '
$message = 'Configure Proxies for: npm, git'
$result = $host.ui.PromptForChoice($title, $message, $options, 0)

switch($result){
	0 {
		echo 'Setting Proxy to http://172.16.199.40:8080';
		echo 'Setting git proxy...';
		git config --global http.proxy http://172.16.199.40:8080;
		git config --global https.proxy http://172.16.199.40:8080;
		echo 'Done...';
		echo 'Setting npm proxy...';
		npm config set proxy http://172.16.199.40:8080; 
		echo 'Done...';
	}

	1 {
		echo 'Setting Proxy to http://172.16.199.20:8080';
		echo 'Setting git proxy...';
		git config --global http.proxy http://172.16.199.20:8080;
		git config --global https.proxy http://172.16.199.20:8080;
		echo 'Done...';
		echo 'Setting npm proxy...';
		npm config set proxy http://172.16.199.20:8080;
		echo 'Done...';
	}

	2 {
		echo 'Setting Proxy to http://172.16.199.21:8080';
		echo 'Setting git proxy...';
		git config --global http.proxy http://172.16.199.21:8080;
		git config --global https.proxy http://172.16.199.21:8080;
		echo 'Done...';
		echo 'Setting npm proxy...';
		npm config set proxy http://172.16.199.41:8080;
		echo 'Done...';
	}
	3 {
		echo 'Unsetting git proxy vars...';
		git config --global --unset http.proxy;
		git config --global --unset https.proxy;
		echo 'Done...';
		echo 'Unsetting npm proxy vars...'
		npm config rm proxy;
		echo 'Done...';
	}

}
