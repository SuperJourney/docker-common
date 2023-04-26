#!/bin/bash
## example:
#  create-cluster redis-7000:7000 redis-7001:7001 redis-7002:7002 
#
#

if [ $# -lt 1 ]; then
	echo "$0 need paramter"
fi

function getDomainIp() {
	if test $1 == ""; then
		echo "need a paramter"
	fi
	url=$(echo $1 | cut -d ":" -f1)
	port=$(echo $1 | cut -d ":" -f2)
	if test $port == $url; then
		port="6379"
	fi
	result=$(ping $url -c 1 | sed '1{s/[^(]*(//;s/).*//;q}')
}

cmd="redis-cli --cluster create --cluster-yes "
for domain in $@; do
	getDomainIp $domain
	cmd=$(printf "%s %s:%s " "$cmd" "$result" "$port")
done

$cmd