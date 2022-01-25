for port in `seq 7000 7002`; do \
base=7000
myips=$[port-base+2]
docker run -d -ti -p ${port}:${port} -p 1${port}:1${port} \
--privileged=true -v $(pwd)/${port}/conf/redis.conf:/usr/local/etc/redis/redis.conf \
--privileged=true -v $(pwd)/${port}/data:/data \
--restart always --name r${port} --net redis-net --ip 172.19.0.${myips} \
--sysctl net.core.somaxconn=1024 redis redis-server /usr/local/etc/redis/redis.conf; \
done
