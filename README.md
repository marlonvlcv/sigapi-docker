# Proyecto Integrador – SIGAPI

## Infraestructura Docker y Base de Datos

Repositorio correspondiente al componente de infraestructura y persistencia del proyecto integrador SIGAPI, desarrollado para la asignatura de Sistemas Distribuidos.

## Tecnologías utilizadas

- Docker Desktop
- Docker Compose
- PostgreSQL 15
- TablePlus

## Estructura del repositorio

```text
sigapi-docker/
├── docker-compose.yml
├── database/
│   └── sigapi.sql
└── README.md
```

## Configuración de la infraestructura

Se configuró un servicio PostgreSQL mediante Docker Compose, utilizando la imagen `postgres:15-alpine`.

El servicio cuenta con las siguientes características:

- Contenedor: `sigapi_postgres`
- Base de datos: `sigapi_db`
- Usuario: `sigapi_user`
- Puerto: `5432`
- Volumen persistente: `pgdata`

## Ejecución del proyecto

1. Instalar y ejecutar Docker Desktop.
2. Clonar este repositorio.
3. Abrir una terminal en la carpeta del proyecto.
4. Ejecutar el siguiente comando:

```bash
docker compose up -d
```

5. Verificar que el contenedor esté activo:

```bash
docker ps
```

## Base de datos

Se desarrolló un script SQL ubicado en la carpeta `database`, que contiene la definición de la tabla `estudiantes` y la inserción de registros ficticios para realizar pruebas.

El script puede ejecutarse desde TablePlus mediante una conexión a PostgreSQL.

## Parámetros de conexión

| Parámetro | Valor |
|---|---|
| Host | localhost |
| Puerto | 5432 |
| Base de datos | sigapi_db |
| Usuario | sigapi_user |

## Pruebas realizadas

- Creación y consulta de registros.
- Eliminación de registros.
- Prueba de persistencia mediante el reinicio del contenedor.
- Prueba de consistencia mediante las restricciones de integridad de PostgreSQL.

## Sistemas Distribuidos

La infraestructura permitió desplegar el motor de persistencia de manera aislada y reproducible mediante Docker Compose, facilitando su ejecución y administración en diferentes entornos.