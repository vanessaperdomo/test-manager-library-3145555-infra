# test-manager-library-3145555-infra

> **Infraestructura de Contenedores y Motor de Base de Datos — Manager Library**
> Ficha ADSO 3145555 · SDD (Spec-Driven Development)

Este repositorio contiene la definición de infraestructura contenerizada para levantar el motor de base de datos **PostgreSQL 16**, con el esquema oficial `library`, red compartida y volumen persistente.

---

## 1. Requisitos Cumplidos según la Especificación

- **Motor:** PostgreSQL 16 (`postgres:16-alpine`).
- **Esquema:** `library` inicializado automáticamente mediante script en `docker-entrypoint-initdb.d/01-init-schema.sql`.
- **Extensiones:** `uuid-ossp` y `pgcrypto` habilitadas para soportar identificadores UUID v4 nativos.
- **Zona Horaria:** Servidor forzado a `UTC`.
- **RNF-5:** El entorno levanta con un solo comando y la base de datos arranca limpia.

---

## 2. Puesta en Marcha

### Paso 1: Configurar variables de entorno
```bash
cp .env.example .env
```

### Paso 2: Levantar el contenedor
```bash
docker compose up -d
```

### Paso 3: Verificar estado de salud
```bash
docker compose ps
```
El contenedor `manager-library-postgres` debe reportar `Up (healthy)`.

---

## 3. Parámetros de Conexión (Para Backend Laravel)

| Variable | Valor por defecto |
|---|---|
| `DB_CONNECTION` | `pgsql` |
| `DB_HOST` | `127.0.0.1` (o `postgres` dentro de la red docker) |
| `DB_PORT` | `5432` |
| `DB_DATABASE` | `manager_library` |
| `DB_USERNAME` | `library_user` |
| `DB_PASSWORD` | `library_secret` |
| `DB_SCHEMA` | `library` |

---

## 4. Detener y Limpiar

```bash
# Detener contenedores
docker compose down

# Detener y eliminar volúmenes (reinicio desde cero)
docker compose down -v
```
