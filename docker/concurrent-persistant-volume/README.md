To test this:
```
$ [sudo] docker build -t cont1 .
$ [sudo] docker build -t cont2 .
$ [sudo] docker run -d -v <currdir>/logdir:/var/log/logdir cont1 
$ [sudo] docker run -d -v <currdir>/logdir:/var/log/logdir cont2
$ tailf logdir/concurrent.log
```

Demo:
