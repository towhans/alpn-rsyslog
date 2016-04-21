#!/bin/bash

DEFAULT=true
if [ "X${FORWARD_TO_ELASTICSEARCH}" == "Xtrue" ];then
   ln -sf /etc/rsyslog.d/elasticsearch.conf.disabled /etc/rsyslog.d/elasticsearch.conf  
   DEFAULT=false
fi
if [ "X${FORWARD_TO_KAFKA}" == "Xtrue" ];then
   ln -sf /etc/rsyslog.d/kafka.conf.disabled /etc/rsyslog.d/kafka.conf  
   DEFAULT=false
fi
if [ "X${FORWARD_TO_HEKA}" == "Xtrue" ];then
   ln -sf /etc/rsyslog.d/heka.conf.disabled /etc/rsyslog.d/heka.conf  
   DEFAULT=false
fi
if [ "X${FORWARD_TO_FILE}" == "Xtrue" ];then
   if [ ! -f /etc/rsyslog.d/file.conf ];then
       ln -sf /etc/rsyslog.d/file.conf.disabled /etc/rsyslog.d/file.conf  
   fi
   DEFAULT=false
fi
if [ ${DEFAULT} == "true" ];then
   if [ ! -f /etc/rsyslog.d/file.conf ];then
       ln -sf /etc/rsyslog.d/file.conf.disabled /etc/rsyslog.d/file.conf  
   fi
fi
