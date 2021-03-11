#!/usr/bin/env sh

scriptname="$(basename $0)"
actionname="$1"
tunnelname=$(echo "$2" | iconv -t ascii//TRANSLIT | sed -E 's/[^a-zA-Z0-9-]+/-/g' | sed -E 's/^-+|-+$//g' | tr A-Z a-z)
remotedata="$3"
tunnelssh="$4"

if [ $# -lt 4 ] 
 then
    echo "Usage: $scriptname start | stop LOCAL_PORT:RDP_IP:RDP_PORT SSH_NODE_IP"
    exit
fi

case "$actionname" in

start)

  echo "Starting tunnel to $tunnelssh"
  ssh -M -S ~/.ssh/sockets/$tunnelname.control -fnNT -L $remotedata $tunnelssh
  ssh -S ~/.ssh/sockets/$tunnelname.control -O check $tunnelssh
  ;;

stop)
  echo "Stopping tunnel to $tunnelssh"
  ssh -S ~/.ssh/sockets/$tunnelname.control -O exit $tunnelssh 
 ;;

*)
  echo "Did not understand your argument, please use start|stop"
  ;;

esac
