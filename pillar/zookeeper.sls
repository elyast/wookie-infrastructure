zookeeper:
  conf_dist_dir: conf.dist
  conf_dir: conf.zookeeper1_cluster
  jvm_opts: -Xmx1G
  autopurge.purgeInterval: 1
  autopurge.snapRetainCount: 3
  port: 2181
  home: /usr/lib/zookeeper
  conf: /etc/zookeeper/conf
  version: 3.4.5+cdh5.4.4+91-1.cdh5.4.4.p0.6~trusty-cdh5.4.4
