chronos:
  env: {"LD_LIBRARY_PATH": "/lib:/usr/local/lib:/lib:/usr/lib", "JAVA_LIBRARY_PATH":"/usr/local/lib:/lib:/usr/lib" }
  cpus: 0.5
  instances: 1
  mem: 1024
  ports: [8031]
  uris:
    - salt://oss/chronos-2.4.0.jar
  upgradeStrategy:
    minimumHealthCapacity: 1
  constraints: [['hostname', 'UNIQUE']]
  healthChecks:
    - protocol: HTTP
      portIndex: 0
      path: /
