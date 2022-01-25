docker exec -i r7001 /bin/bash <<EOF
   echo yes > in.txt && redis-cli --cluster create 172.19.0.2:7000 172.19.0.3:7001 172.19.0.4:7002 --cluster-replicas 0 < in.txt
   exit
EOF
