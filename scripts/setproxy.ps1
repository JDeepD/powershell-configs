$hostel = New-Object System.Management.Automation.Host.ChoiceDescription '&hostel', 'http://172.16.199.40:8080'
$lib = New-Object System.Management.Automation.Host.ChoiceDescription '&library', 'http://172.16.199.20:8080'
$h9 = New-Object System.Management.Automation.Host.ChoiceDescription '&hostel9', 'http://172.16.199.41:8080'
$unset = New-Object System.Management.Automation.Host.ChoiceDescription '&unset', ''

$options = [System.Management.Automation.Host.ChoiceDescription[]]($hostel, $lib, $h9, $unset)

function setproxy($proxyserver){
		echo 'Setting Proxy to' $proxyserver;
		echo 'Setting git proxy...';
		git config --global http.proxy $proxyserver;
		git config --global https.proxy $proxyserver;
		echo 'Done...';
		echo 'Setting npm proxy...';
		npm config set proxy $proxyserver;
		echo 'Done...';
}

function unsetproxy{

		echo 'Unsetting git proxy vars...';
		git config --global --unset http.proxy;
		git config --global --unset https.proxy;
		echo 'Done...';
		echo 'Unsetting npm proxy vars...'
		npm config rm proxy;
		echo 'Done...';
}


function setproxyinteractive{
	$title = 'Select Proxy Server: '
	$message = 'Configure Proxies for: npm, git'
	$result = $host.ui.PromptForChoice($title, $message, $options, 0)

	switch($result){
		0 {
			setproxy("172.16.199.40:8080")
		}

		1 {
			setproxy("172.16.199.20:8080")
		}

		2 {
			setproxy("172.16.199.41:8080");
		}
		3 {
			unsetproxy;
		}

	}

}

$table = @{
	"hostel" = "http://172.16.199.40:8080"
	"library" = "http://172.16.199.20:8080"
	"h9" = "http://172.16.199.41:8080"
}

$proxyserver=$args[0]

if($proxyserver -eq "unset"){
	unsetproxy;
}
elseif($proxyserver -in $table.Keys){
	setproxy($table[$proxyserver])
}
else{
	echo "No proxy server found";
	setproxyinteractive;
}
