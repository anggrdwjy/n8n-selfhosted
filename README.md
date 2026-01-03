## This Script Automation For Build N8N Selfhosted on Docker Compose

## Information

Before using this program, make sure to update the repository `sudo apt update` and install git `sudo apt install git -y` to maximize the running of the program. I am not responsible for any consequences caused by this program. It is recommended to use this script when the new server is installed. This program has been tested on Ubuntu Server 24.04 or Newer

## Features
* Simple Script For Build N8N Selfhosted
* Include Portainer for Manage Docker Container
* Activation Firewall

## Tested Version
* Ubuntu 24.04
* Newer

## Installing Program
```
root@ubuntu:/home/ubuntu# git clone https://github.com/anggrdwjy/n8n-selfhosted.git
Cloning into 'n8n-selfhosted'...
remote: Enumerating objects: 163, done.
remote: Counting objects: 100% (2/2), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 163 (delta 1), reused 0 (delta 0), pack-reused 161 (from 1)
Receiving objects: 100% (163/163), 52.50 KiB | 398.00 KiB/s, done.
Resolving deltas: 100% (80/80), done.
root@ubuntu:/home/ubuntu# cd n8n-selfhosted/
root@ubuntu:/home/ubuntu/n8n-selfhosted# chmod -R 777 *
root@ubuntu:/home/ubuntu/n8n-selfhosted# ls -l
total 8
-rwxrwxrwx 1 root root  735 Jan  3 18:23 n8n-selfhosted.sh
drwxrwxrwx 2 root root 4096 Jan  3 18:23 support
root@ubuntu:/home/ubuntu/n8n-selfhosted# 
```

## Running Program
```
root@ubuntu:/home/ubuntu/n8n-selfhosted# ./n8n-selfhosted.sh 
Hit:1 http://id.archive.ubuntu.com/ubuntu noble InRelease
Hit:2 http://id.archive.ubuntu.com/ubuntu noble-updates InRelease
Hit:3 http://id.archive.ubuntu.com/ubuntu noble-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu noble-security InRelease
Reading package lists... Done
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
* * * * * *
Creating n8n_n8n_1 ... done
CONTAINER ID   IMAGE                        COMMAND                  CREATED         STATUS         PORTS                                                               NAMES
610a5a6d3238   n8nio/n8n:latest             "tini -- /docker-ent…"   5 seconds ago   Up 2 seconds   0.0.0.0:15678->5678/tcp, [::]:15678->5678/tcp                       n8n_n8n_1
ba814021b4dd   portainer/portainer-ce:lts   "/portainer"             5 minutes ago   Up 5 minutes   8000/tcp, 9000/tcp, 0.0.0.0:19443->9443/tcp, [::]:19443->9443/tcp   portainer
Rules updated
Rules updated (v6)
Rules updated
Rules updated (v6)
Rules updated
Rules updated (v6)
Command may disrupt existing ssh connections. Proceed with operation (y|n)? y
Firewall is active and enabled on system startup
● ufw.service - Uncomplicated firewall
     Loaded: loaded (/usr/lib/systemd/system/ufw.service; enabled; preset: enabled)
     Active: active (exited) since Sat 2026-01-03 18:19:11 UTC; 14min ago
       Docs: man:ufw(8)
   Main PID: 378 (code=exited, status=0/SUCCESS)
        CPU: 4ms

Jan 03 18:19:11 ubuntu systemd[1]: Starting ufw.service - Uncomplicated firewall...
Jan 03 18:19:11 ubuntu systemd[1]: Finished ufw.service - Uncomplicated firewall.
root@ubuntu:/home/ubuntu/n8n-selfhosted# 
```

## Verification Docker
```
root@ubuntu:/home/ubuntu/n8n-selfhosted# docker ps -a
CONTAINER ID   IMAGE                        COMMAND                  CREATED          STATUS          PORTS                                                               NAMES
610a5a6d3238   n8nio/n8n:latest             "tini -- /docker-ent…"   46 seconds ago   Up 43 seconds   0.0.0.0:15678->5678/tcp, [::]:15678->5678/tcp                       n8n_n8n_1
ba814021b4dd   portainer/portainer-ce:lts   "/portainer"             5 minutes ago    Up 5 minutes    8000/tcp, 9000/tcp, 0.0.0.0:19443->9443/tcp, [::]:19443->9443/tcp   portainer
root@ubuntu:/home/ubuntu/n8n-selfhosted# 
```

## Testing Access Web UI

Dashboard UI Portainer
```
https://ip-address:19443
```

Dashboard UI N8N Selfhosted
```
https://ip-address:15678
```
## Support

* [:octocat: Follow me on GitHub](https://github.com/anggrdwjy)
* [🔔 Subscribe me on Youtube](https://www.youtube.com/@anggarda.wijaya)


## Bugs

Please open an issue on GitHub with as much information as possible if you found a bug.
* Your Docker Version
* All the logs and message outputted
* etc
