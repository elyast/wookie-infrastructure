cassandra-mesos:
  cpus: 0.5
  mem: 512
  ports: [2500]
  environment:
    JAVA_OPTS: -Xms256m -Xmx256m
    CASSANDRA_CLUSTER_NAME: dev-test
    CASSANDRA_SEED_COUNT: "2"
    CASSANDRA_NODE_COUNT: "3"
    CASSANDRA_RESOURCE_CPU_CORES: "2.0"
    CASSANDRA_RESOURCE_MEM_MB: "2048"
    CASSANDRA_RESOURCE_DISK_MB: "2048"
    CASSANDRA_HEALTH_CHECK_INTERVAL_SECONDS: "60"
    CASSANDRA_ZK_TIMEOUT_MS: "10000"
  uris:
    - salt://oss/cassandra-mesos-executor.jar
    - salt://oss/cassandra-mesos-framework.jar
    - salt://oss/jre-7u76-linux-x64.tar.gz
    - salt://oss/apache-cassandra-2.1.4-bin.tar.gz
  healthChecks:
    -  gracePeriodSeconds: 120
       intervalSeconds: 30
       maxConsecutiveFailures: 0
       path: /health/cluster
       portIndex: 0
       protocol: HTTP
       timeoutSeconds: 5
    -  gracePeriodSeconds: 120
       intervalSeconds: 30
       maxConsecutiveFailures: 3
       path: /health/process
       portIndex: 0
       protocol: HTTP
       timeoutSeconds: 5
  instances: 1

cassandra:
  url: salt://oss
  checksum: md5=e1b1036f6db64fb0c8c51799c05d4349
  tarball: apache-cassandra-2.1.4-bin.tar.gz
  dirname: apache-cassandra-2.1.4
