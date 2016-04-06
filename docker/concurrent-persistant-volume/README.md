To test this:
```
$ [sudo] docker build -t cont1 .
$ [sudo] docker build -t cont2 .
$ [sudo] docker run -d -v <currdir>/logdir:/var/log/logdir cont1 
$ [sudo] docker run -d -v <currdir>/logdir:/var/log/logdir cont2
$ tailf logdir/concurrent.log
```
You could see the host names altering.

Demo:
```
[anovil@ubuntu-anovil concurrent-persistant-volume]$ docker build -t cont1 .
Sending build context to Docker daemon 9.216 kB
Step 1 : FROM ubuntu
 ---> 6cc0fc2a5ee3
Step 2 : COPY run.sh /run.sh
 ---> Using cache
 ---> 881826cbd438
Step 3 : CMD /bin/bash /run.sh
 ---> Using cache
 ---> cf6eeeb71b1a
Successfully built cf6eeeb71b1a
[anovil@ubuntu-anovil concurrent-persistant-volume]$ docker build -t cont2 .
Sending build context to Docker daemon 9.216 kB
Step 1 : FROM ubuntu
 ---> 6cc0fc2a5ee3
Step 2 : COPY run.sh /run.sh
 ---> Using cache
 ---> 881826cbd438
Step 3 : CMD /bin/bash /run.sh
 ---> Using cache
 ---> cf6eeeb71b1a
Successfully built cf6eeeb71b1a
[anovil@ubuntu-anovil concurrent-persistant-volume]$ docker run -d -v `pwd`/logdir:/var/log/logdir cont1
2076eaad406a0f2edc7fca37b2267451e6d4b8030443e45c8bd25f73109f1c3f
[anovil@ubuntu-anovil concurrent-persistant-volume]$ docker run -d -v `pwd`/logdir:/var/log/logdir cont2
4bbab4486b766f3a7ad3df36a4683f543bc765c60d4a0064f67bd05373794562
[anovil@ubuntu-anovil concurrent-persistant-volume]$ docker ps
CONTAINER ID        IMAGE               COMMAND               CREATED             STATUS              PORTS               NAMES
2076eaad406a        cont2               "/bin/bash /run.sh"   3 seconds ago       Up 2 seconds                            drunk_joliot
4bbab4486b76        cont1               "/bin/bash /run.sh"   26 seconds ago      Up 26 seconds                           determined_sinoussi
[anovil@ubuntu-anovil concurrent-persistant-volume]$ tailf logdir/concurrent.log
Wed Apr 6 10:25:17 UTC 2016:2076eaad406a
Wed Apr 6 10:25:18 UTC 2016:4bbab4486b76
Wed Apr 6 10:25:22 UTC 2016:2076eaad406a
Wed Apr 6 10:25:23 UTC 2016:4bbab4486b76
[anovil@ubuntu-anovil concurrent-persistant-volume]$
```
One container has host name `2076eaad406a` and other `4bbab4486b76`

This proves that 2 containers can concurrently write to same file mounted from host without overwriting each other.
