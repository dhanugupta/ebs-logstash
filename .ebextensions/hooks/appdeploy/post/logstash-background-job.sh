#!/usr/bin/env bash

for pid in `ps aux | grep /etc/logstash/conf.d | grep -v grep | tr -s ' ' | cut -d ' ' -f 2`
do
    kill -9 $pid
done

export HOME=/var/lib/logstash

/opt/logstash/bin/logstash \
    -f /etc/logstash/conf.d \
    -l /var/log/logstash/logstash.log \
    > /var/log/logstash/logstash.stdout \
    2> /var/log/logstash/logstash.err \
    &