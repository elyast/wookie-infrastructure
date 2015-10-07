spark:
  url: http://as-master/deps/
  checksum: md5=b9c3aadba13dbdbe7025d3d3d89eb14e
  tarball: spark-1.4.1-bin-dist.tgz
  dirname: spark-1.4.1-bin-dist
  executor.memory: 2g
  serializer: org.apache.spark.serializer.KryoSerializer
  mesos.coarse: "false"
  job.memory: 2g
  tachyonStore.baseDir: /cache
  eventlog.dir: /spark-events
  max.dynamic.partitions: 10000
  dynamic.partition: "true"
  dynamic.partition.mode: nonstrict
  mesos.mesosExecutor.cores: 0.1
  hive.username: hive
  hive.password: hive
  sample: 'true'
  ui.port: 2800

sparkjdbc:
  cpus: 1
  instances: 1
  mem: 4096
  ports: [8775, 10000]
  check_port_index: 0
  constraints: [['hostname', 'UNIQUE']]
  upgradeStrategy:
    minimumHealthCapacity: 1
  healthChecks:
    - protocol: HTTP
      portIndex: 0
      path: /

sparkhistory:
  cpus: 0.5
  instances: 1
  mem: 1024
  ports: [5999]
  upgradeStrategy:
    minimumHealthCapacity: 1
  constraints: [['hostname', 'UNIQUE']]
  healthChecks:
    - protocol: HTTP
      portIndex: 0
      path: /

metastore.scripts:
  - executable: upgrade-0.12.0-to-0.13.0.postgres.sql
    files:
      - name: upgrade-0.12.0-to-0.13.0.postgres.sql
        source: salt://spark/upgrades/upgrade-0.12.0-to-0.13.0.postgres.sql
      - name: 016-HIVE-6386.postgres.sql
        source: salt://spark/upgrades/016-HIVE-6386.postgres.sql
      - name: 017-HIVE-6458.postgres.sql
        source: salt://spark/upgrades/017-HIVE-6458.postgres.sql
      - name: 018-HIVE-6757.postgres.sql
        source: salt://spark/upgrades/018-HIVE-6757.postgres.sql
      - name: hive-txn-schema-0.13.0.postgres.sql
        source: salt://spark/upgrades/hive-txn-schema-0.13.0.postgres.sql
    user: hive
    database: metastore
