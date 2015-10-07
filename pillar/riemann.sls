riemann:
  url: http://as-master/deps/
  checksum: md5=78f44060f75dca711dd50d143fb36de2
  tarball: riemann-0.2.9.tar.bz2
  dirname: riemann-0.2.9
  tools.version: 0.2.5
  dash.version: 0.2.11
  client.version: 0.2.5
  hadoop.version: 0.1.1
  postgresql.version: 0.1.1
  dash.port: 2421
  jmx_url: http://as-master/deps/riemann-jmx-clj-0.1.1-SNAPSHOT-standalone.jar
  jmx_checksum: md5=3c9cbbd7c000110438fab6621d22230c
  extra_url: http://as-master/deps/riemann-extra-0.2.6-standalone.jar
  extra_checksum: md5=d20d4beceaec3ed9fb5c56d461f5bde4
  user: riemann
  group: riemann
  server.port: 2422
  ws.port: 2423
  repl.port: 2424
  interval: 10
  timeout: 30
  tcp: 'false'

schedule:
  job-riemann-reload:
    function: state.sls
    seconds: 3600
    args:
      - riemann.agent_checks
    kwargs:
      concurrent: True

riemann_checks:
  proc:
    hdfs.namenode:
      - regexp: NameNode
        name: namenode-check
      - regexp: DFSZK
        name: zkfc-check
    hdfs.journalnode:
      - regexp: JournalNode
        name: journalnode-check
    hdfs.datanode:
      - regexp: DataNode
        name: datanode-check
    mesos.master:
      - regexp: mesos-master
        name: mesos-master-check
    mesos.slave:
      - regexp: mesos-slave
        name: mesos-slave-check
    tachyon.master:
      - regexp: TachyonMaster
        name: tachyon-master-check
    tachyon.slave:
      - regexp: TachyonWorker
        name: tachyon-worker-check
    zookeeper.server:
      - regexp: QuorumPeerMain
        name: zookeeper-check
    postgresql:
      - regexp: bin/postgres
        name: postgres-check
    haproxy:
      - regexp: haproxy
        name: haproxy-check
    marathon:
      - regexp: marathon-assembly
        name: marathon-check
  http:
    elasticsearch:
      endpoint: _/nodes/_local/stats/http,indices,fs
    mesos.*:
      endpoint: /metrics/snapshot
    marathon:
      endpoint: /metrics
    spark.*:
      endpoint: /metrics/json
  jmx:
    cassandra_server:
      - obj: "org.apache.cassandra.metrics:type=DroppedMessage,scope=READ,name=Dropped"
        attr: [ Count ]
      - obj: "org.apache.cassandra.metrics:type=DroppedMessage,scope=MUTATION,name=Dropped"
        attr: [ Count ]
      - obj: "org.apache.cassandra.metrics:type=DroppedMessage,scope=COUNTER_MUTATION,name=Dropped"
        attr: [ Count ]
      - obj: "org.apache.cassandra.metrics:type=ColumnFamily,name=WriteLatency"
        attr: [ Count, Mean, 50thPercentile, StdDev, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "org.apache.cassandra.metrics:type=ColumnFamily,name=ReadLatency"
        attr: [ Count, Mean, 50thPercentile, StdDev, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=CounterMutationStage,name=ActiveTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=MutationStage,name=ActiveTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=ReadStage,name=ActiveTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=CounterMutationStage,name=PendingTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=MutationStage,name=PendingTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=ThreadPools,path=request,scope=ReadStage,name=PendingTasks"
        attr: [ Value ]
      - obj: "org.apache.cassandra.metrics:type=Storage,name=Load"
        attr: [ Count ]
      - obj: "org.apache.cassandra.metrics:type=Storage,name=Exceptions"
        attr: [ Count ]
    kafka_server:
      - obj: "kafka.server:type=BrokerTopicMetrics,name=BytesInPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=BrokerTopicMetrics,name=BytesOutPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=BrokerTopicMetrics,name=FailedFetchRequestsPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=BrokerTopicMetrics,name=FailedProduceRequestsPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=BrokerTopicMetrics,name=MessagesInPerSec"
        attr: [ Count, OneMinuteRate, FiveMinuteRate, FifteenMinuteRate, MeanRate ]
      - obj: "kafka.server:type=ReplicaManager,name=PartitionCount"
        attr: [ Value ]
      - obj: "kafka.network:type=RequestChannel,name=RequestQueueSize"
        attr: [ Value ]
      - obj: "kafka.controller:type=KafkaController,name=ActiveControllerCount"
        attr: [ Value ]
