
## usage example

Edit or create new remmina server connection

**schema** 

`~/.ssh/rdp-tunnel.sh ACTION TUNNELNAME LOCAL_PORT:REMOTE_SERVER:REMOTE_PORT TUNNEL_PROXY`

|name|description|
|--|--|
|**ACTION**| start\|stop |
|**TUNNELNAME**| "string identify socket"  slugify to create socket file into ~/.ssh/sockets/string-identify-socket.control |
|**LOCAL_PORT**| the door that will be exposed locally if we use the same port for two connections it will crash |
|**REMOTE_SERVER**| the ip of the server that you would access if you had it on the proxy server that will be used |
|**REMOTE_PORT**| the service port that runs on the server |
|**TUNNEL_PROXY**| the connection you are going to use as a proxy, it needs to be in your ~/.ssh/config preferably using the access keys |


I use the combination **(% g-% p)** of the remmina group name and connection name to be my TUNNELNAME (this needs to be unique, it will see the socket name)

**pre-command**

`~/.ssh/rdp-tunnel.sh start "%g-%p" 63394:192.168.8.176:3389 tunnel-name-1`

**post-command**

`~/.ssh/rdp-tunnel.sh stop "%g-%p" 63394:192.168.8.176:3389 tunnel-name-1`

![image](https://user-images.githubusercontent.com/181354/110811902-e5953200-8265-11eb-9a57-147490fa0135.png)

**you can and should use this script to access anything, I use it constantly to access systems and services that do not have a public ip going through 1,2,3,4,5 or more ssh proxies**

see more into :
1. [ssh config](https://linuxize.com/post/using-the-ssh-config-file/)
2. [ssh mach](https://mike.place/2017/ssh-match/)
3. [ssh jump hosts](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts)
4. [sshuttle python ssh](https://github.com/sshuttle/sshuttle)

Refs:
 1. https://remmina.org/remmina-rdp-ssh-tunnel/
 2. https://kgibran.wordpress.com/2019/03/13/remmina-rdp-ssh-tunnel-with-pre-and-post-scripts/
 3. https://stackoverflow.com/questions/2241063/bash-script-to-setup-a-temporary-ssh-tunnel/15198031#15198031
 4. https://gist.github.com/oneohthree/f528c7ae1e701ad990e6
