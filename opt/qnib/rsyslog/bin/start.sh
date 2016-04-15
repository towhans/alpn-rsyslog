#!/usr/local/bin/dumb-init /bin/bash

function stop_rsyslog {
     PID=$(cat /var/run/rsyslogd.pid)
     echo "Stopping rsyslog[${PID}]"
     kill -9 ${PID}
     if [ -f /var/run/rsyslogd.pid ];then
         echo "GarbageCollect PID file"
         rm -f /var/run/rsyslogd.pid
     fi
}

function check_heka {
    cnt_srv=$(curl -s localhost:8500/v1/catalog/service/heka|grep -c "\"Node\":\"$(hostname)\"")
    if [ ${cnt_srv} -ne 1 ];then
        echo "[start_rsyslog] No running 'hdfs service yet, sleep 5 sec'"
        sleep 5
        check_heka
    fi
}

trap stop_rsyslog HUP INT TERM EXIT

/opt/qnib/rsyslog/bin/configure-targets.sh

/usr/sbin/rsyslogd -n
