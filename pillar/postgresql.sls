postgresql:
  dir: /etc/postgresql/9.3/main
  password: C1NYJV981ZG5JY9OdzUh
  bin: /usr/lib/postgresql/9.3/bin
  config:
    data_directory: /mnt/lib/postgresql/9.3/main
    hba_file: /etc/postgresql/9.3/main/pg_hba.conf
    ident_file: /etc/postgresql/9.3/main/pg_ident.conf
    listen_addresses: 0.0.0.0
    port: 5432
    max_connections: 100
    shared_buffers: 24MB
    log_line_prefix: "%t "
    datestyle: "iso, mdy"
    default_text_search_config: pg_catalog.english
    ssl: false
  pg_hba:
    - type: local
      db: all
      user: postgres
      addr: ""
      method: ident
    - type: local
      db: all
      user: all
      addr: ""
      method: trust
    - type: host
      db: all
      user: all
      addr: 0.0.0.0/0
      method: md5
    - type: host
      db: all
      user: all
      addr: ::1/128
      method: md5

postgresql.users:
  - name: hive
    password: hive
    createdb: False
    createroles: False
    superuser: False

postgresql.databases:
  - name: metastore
    owner: hive
    encoding: UTF8
    template: template0

postgresql.scripts:
  - name: hive-schema-0.13.0.postgres.sql
    source: salt://spark/files/hive-schema-0.13.0.postgres.sql
    user: hive
    database: metastore
