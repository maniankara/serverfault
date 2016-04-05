#!/bin/bash

while true
do
  echo `date`:`hostname` >>/var/log/logdir/concurrent.log
  sleep 5
done

