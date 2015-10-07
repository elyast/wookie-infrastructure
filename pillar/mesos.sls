mesos:
  {% if grains['os'].lower() == 'ubuntu' -%}
  {% if grains['oscodename'].lower() == 'trusty' -%}
  url: http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.23.0-1.0.ubuntu1404_amd64.deb
  {% elif grains['oscodename'].lower() == 'raring' -%}
  url: http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.23.0-1.0.ubuntu1404_amd64.deb
  {% elif grains['oscodename'].lower() == 'precise' -%}
  url: http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.23.0-1.0.ubuntu1404_amd64.deb
  {% endif -%}
  {% endif -%}
  libmesos: /usr/local/lib/libmesos.so
  master.port: 5951
  slave.port: 5952
  resources: 'ports(*):[31000-35000,6950-7200,9000-9050,9150-9225,2900-2950]'

mesos-dns:
  url: http://as-master/deps
  checksum: md5=898052021f930711a8b2dfdf3bedb2f8
  tarball: mesos-dns
  configuration:
    resolvers:
      - 192.168.0.3
    httpport: 8053
    port: 53
    domain: mesos
