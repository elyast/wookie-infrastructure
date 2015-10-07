zeppelin:
  url: http://as-master/deps/
  tarball: zeppelin-0.6.0-incubating-SNAPSHOT.tar.gz
  dirname: zeppelin-0.6.0-incubating-SNAPSHOT
  checksum: md5=4dfcb08816d6e01fea4a0a683143ef6d
  env: {"LD_LIBRARY_PATH": "/lib:/usr/local/lib:/lib:/usr/lib", "JAVA_LIBRARY_PATH":"/usr/local/lib:/lib:/usr/lib" }
  cpus: 2
  instances: 1
  port: 2901
  mem: 1024
  ports: [2901, 2902]
  upgradeStrategy:
    minimumHealthCapacity: 1
  constraints: [['hostname', 'UNIQUE']]
  healthChecks:
    - protocol: HTTP
      portIndex: 0
      path: /
