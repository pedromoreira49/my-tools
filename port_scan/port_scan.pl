#!/usr/bin/perl

use Socket;

$addr = <@ARGV>;
$ports = 1;

if( $addr == ""){
	print "Usage: perl port_scan.pl [target]\n";
	print "Example: perl port_scan.pl 127.0.0.1\n";
}else{
	socket(SOCKET, PF_INET, SOCK_STREAM, getprotobyname('tcp'))[2]
		or die "Can't create a socket $!\n";

	for($ports = 1; $ports <= 1000; $ports++){
		$resp = connect(SOCKET, pack_sockaddr_in($ports, inet_aton($addr)));
		if($resp == 1){
			print "|Port| ", $ports, " |open|\n";
		}
	}
}

close SOCKET;
