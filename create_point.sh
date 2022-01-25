for port in `seq 7000 7002`; do \
base=7000 \
&& ip=$[port-base+2] \
&& mkdir -p ./${port}/conf \
&& PORT=${port} TEMP=${ip} envsubst < ./redis-config.tmpl > ./${port}/conf/redis.conf \
&& mkdir -p ./${port}/data; \
done
