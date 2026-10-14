# Automated Healthcheck for PostgreSQL & API Containers
docker ps --filter "name=manager-library" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
