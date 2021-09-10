#!/bin/bash

. /etc/init.d/functions

check_ip() 
{
	ip=192.168.50.$1
	ping -c1 -i1 -W1 $ip &>/dev/null
	if [ $? -eq 0 ];then
		action "$ip is ok" /bin/true
	else
		action "$ip is failed" /bin/false
	fi
}

main() 
{
	for n in {1..254}
	do
		check_ip $n &
		usleep 200
	done
}

main
