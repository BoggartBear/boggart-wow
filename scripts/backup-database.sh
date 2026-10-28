#!/bin/bash
set -e

mkdir -p /mnt/disk1/data/backups/boggart-wow
DB_PASS="${DOCKER_DB_ROOT_PASSWORD:-password}"

for db in acore_auth acore_characters acore_world; do
  docker exec ac-database sh -lc "mysqldump -h127.0.0.1 -P3306 -uroot -p\"${DB_PASS}\" ${db}" \
    > "/mnt/disk1/data/backups/boggart-wow/${db}-$(date +%F-%H%M%S).sql"
done