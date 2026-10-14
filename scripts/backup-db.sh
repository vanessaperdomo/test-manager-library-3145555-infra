#!/bin/sh
# Automated Database Backup Utility
DATE=$(date +%Y%m%d_%H%M%S)
docker exec manager-library-postgres pg_dump -U postgres -d library > "backup_${DATE}.sql"
echo "Backup created: backup_${DATE}.sql"
