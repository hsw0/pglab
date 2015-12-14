#!/bin/bash

add_hosts() {
	address=$1
	hostname=$2
	grep -q "$hostname" /etc/hosts || echo "$address $hostname" >> /etc/hosts
}

add_hosts 192.168.101.128 db1
add_hosts 192.168.101.129 db2
add_hosts 192.168.101.130 db3
add_hosts 192.168.101.131 db4
add_hosts 192.168.101.132 db5

