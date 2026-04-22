#!/bin/bash

docker exec -i my-oracle-db rman target / <<EOF
BACKUP INCREMENTAL LEVEL 1 DATABASE PLUS ARCHIVELOG;
EXIT;
EOF