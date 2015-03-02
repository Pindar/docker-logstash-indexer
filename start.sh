#!/bin/bash

sed -i "s/host => \"es\"/host => \"$(echo $ELASTICSEARCH_HOST | sed -e 's/[]\/$*.^|[]/\\&/g')\"/" ${LOGSTASH_HOME}/conf/indexer.conf
sed -i "s/host => \"redis\"/host => \"$(echo $REDIS_HOST | sed -e 's/[]\/$*.^|[]/\\&/g')\"/" ${LOGSTASH_HOME}/conf/indexer.conf

exec ${LOGSTASH_HOME}/bin/logstash -f ${LOGSTASH_HOME}/conf