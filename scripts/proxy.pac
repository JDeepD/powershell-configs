function FindProxyForURL(url, host){
	if(shExpMatch(host, '192.*){
		return 'DIRECT'
	}
	return 'PROXY 172.16.199.40:8080; PROXY 172.16.199.20:8080; DIRECT';
}
