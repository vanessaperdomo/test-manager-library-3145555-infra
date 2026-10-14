-- =====================================================================
-- Inicialización de Esquema y Extensiones - Manager Library
-- Especificación: data-model.md §0 (Motor PostgreSQL 16, Esquema 'library', UTC)
-- =====================================================================

-- Habilitar extensiones requeridas para generación de UUID v4
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Crear el esquema oficial 'library' donde residen las 6 tablas
CREATE SCHEMA IF NOT EXISTS library;

-- Configurar búsqueda por defecto al esquema library
ALTER DATABASE manager_library SET timezone TO 'UTC';

-- Asegurar permisos para el usuario de la aplicación
GRANT ALL ON SCHEMA library TO CURRENT_USER;
ALTER DEFAULT PRIVILEGES IN SCHEMA library GRANT ALL ON TABLES TO CURRENT_USER;
ALTER DEFAULT PRIVILEGES IN SCHEMA library GRANT ALL ON SEQUENCES TO CURRENT_USER;
