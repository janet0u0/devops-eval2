# Backend Ventas - Innovatech Chile

Microservicio Spring Boot para la gestión de ventas de Innovatech Chile.

## Tecnologías
- Java 17
- Spring Boot 3.4.4
- MySQL 8.0
- Docker + Docker Compose
- GitHub Actions (CI/CD)

## Requisitos Previos
- Docker y Docker Compose instalados
- Java 17 (solo para desarrollo local)

## Variables de Entorno
| Variable | Descripción | Ejemplo |
|---|---|---|
| DB_ENDPOINT | Host de la base de datos | mysql-ventas |
| DB_PORT | Puerto MySQL | 3306 |
| DB_NAME | Nombre de la base de datos | ventas_db |
| DB_USERNAME | Usuario MySQL | admin |
| DB_PASSWORD | Contraseña MySQL | admin1234 |

## Levantar con Docker Compose
```bash
docker-compose up -d
```

## Pipeline CI/CD
El pipeline se activa automáticamente con push en la rama `deploy`:
1. Copia el código a S3
2. Build de la imagen Docker en EC2 via SSM
3. Push de la imagen a Amazon ECR
4. Deploy automático en la instancia EC2

## Persistencia
Se utiliza named volume `mysql-ventas-data` para garantizar que los datos no se pierdan al reiniciar los contenedores.
