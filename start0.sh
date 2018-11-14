docker run -itd -h etcdtest --restart unless-stopped --net net10 --ip 10.1.1.30 \
	--memory="512m" --memory-swap="512m" --cpuset-cpus=2 -p 4001:4001 \
	-p 2380:2380 -p 2379:2379 -p 4002:4002 -v /root/docker/etcd2/ca:/etc/ssl:ro \
       	--volume=/disk2/etcd/etcdtest.etcd:/etcd-data \
	--name etcdtest quay.io/coreos/etcd:latest /usr/local/bin/etcd \
       	--name=etcdtest --data-dir=/etcd-data/etcdtest.etcd --cert-file=/etc/ssl/server-crt.pem \
	--key-file=/etc/ssl/server-key.pem --trusted-ca-file=/etc/ssl/ca-crt.pem \
	--advertise-client-urls=https://192.168.1.8:4001,http://192.168.1.8:2379 \
	--listen-client-urls=https://0.0.0.0:4001,http://0.0.0.0:2379  \
	--listen-peer-urls=http://0.0.0.0:2380 --initial-advertise-peer-urls=http://10.1.1.30:2380 \
	--peer-cert-file=/etc/ssl/server-crt.pem --peer-key-file=/etc/ssl/server-key.pem \
	--peer-trusted-ca-file=/etc/ssl/ca-crt.pem --initial-cluster-state=new \
       	--initial-cluster-token="token-1001" --initial-cluster \
       	etcdtest=http://10.1.1.30:2380,etcdtest1=http://10.1.1.31:2380,etcdtest2=http://10.1.1.32:2380 


