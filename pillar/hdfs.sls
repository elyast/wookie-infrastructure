cloudera:
  version: cdh5

cloudera_cdh5:
  {% if grains['os'].lower() == 'ubuntu' -%}
  {% if grains['oscodename'].lower() == 'trusty' -%}
  repository: deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5.4.4 contrib
  repository_src: deb-src http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh trusty-cdh5.4.4 contrib
  repository_key_url: http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key
  gplextras_repository: deb [arch=amd64] http://archive.cloudera.com/gplextras5/ubuntu/trusty/amd64/gplextras trusty-gplextras5 contrib
  gplextras_repository_src: deb-src http://archive.cloudera.com/gplextras5/ubuntu/trusty/amd64/gplextras trusty-gplextras5 contrib
  {% elif grains['oscodename'].lower() == 'raring' -%}
  repository: deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/raring/amd64/cdh raring-cdh5.4.4 contrib
  repository_src: deb-src http://archive.cloudera.com/cdh5/ubuntu/raring/amd64/cdh raring-cdh5.4.4 contrib
  repository_key_url: http://archive.cloudera.com/cdh5/ubuntu/raring/amd64/cdh/archive.key
  gplextras_repository: deb [arch=amd64] http://archive.cloudera.com/gplextras5/ubuntu/raring/amd64/gplextras raring-gplextras5 contrib
  gplextras_repository_src: deb-src http://archive.cloudera.com/gplextras5/ubuntu/raring/amd64/gplextras raring-gplextras5 contrib
  {% elif grains['oscodename'].lower() == 'precise' -%}
  repository: deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/precise/amd64/cdh precise-cdh5.4.4 contrib
  repository_src: deb-src http://archive.cloudera.com/cdh5/ubuntu/precise/amd64/cdh precise-cdh5.4.4 contrib
  repository_key_url: http://archive.cloudera.com/cdh5/ubuntu/precise/amd64/cdh/archive.key
  gplextras_repository: deb [arch=amd64] http://archive.cloudera.com/gplextras5/ubuntu/precise/amd64/gplextras precise-gplextras5 contrib
  gplextras_repository_src: deb-src http://archive.cloudera.com/gplextras5/ubuntu/precise/amd64/gplextras precise-gplextras5 contrib
  {% endif %}
  {% endif %}

hdfs:
  conf_dir: conf.hadoop1_cluster
  conf_dist_dir: conf.empty
  superuser: hadoop
  data_dir:
    - /mnt/var/hdfs/data
  name_data_dir:
    - /mnt/var/hdfs/ndata
  dfs.datanode.failed.volumes.tolerated: 0
  dfs.balance.bandwidthPerSec: 10485760
  dfs.replication: 3
  journalnode.port: 8485
  namenode.ui.port: 2425
  datanode.ui.port: 2426
  datanode.port: 50010
  datanode.ipc.port: 50020
  namenode.port: 8020
  home: /usr/lib/hadoop
  conf: /etc/hadoop/conf
