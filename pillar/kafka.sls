kafka-mesos:
  schedulerConfiguration:
    framework-name: kafka-mesos
    storage: zk:/kafka-mesos
  brokerConfiguration:
    cpus: 1
    mem: 1024
    stickinessPeriod: 1h
    failoverDelay: 10s
    failoverMaxDelay: 30m
    failoverMaxTries: 10
    constraints: hostname=unique
    jvmOptions: -Xms128m -XX:PermSize=48m
    options:
      num.network.threads: 4
      num.io.threads: 4
      log.retention.hours: 168
      num.partitions: 2
      log.dirs: /mnt/lib/kafka-logs/$id
    log4jOptions:
      log4j.logger.kafka: INFO
  brokerInstances: 4
  cpus: 0.5
  mem: 512
  ports: [2416]
  jmxPort: 27500
  upgradeStrategy:
    minimumHealthCapacity: 0.5
  healthChecks:
    - gracePeriodSeconds: 120
      intervalSeconds: 30
      maxConsecutiveFailures: 0
      path: /health
      portIndex: 0
      protocol: HTTP
      timeoutSeconds: 5
  instances: 1
  uris:
    - salt://oss/kafka-mesos-0.9.1.4.jar
    - salt://oss/kafka-mesos.sh
    - salt://oss/kafka_2.10-0.8.2.1.tgz
