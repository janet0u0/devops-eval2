# Frontend Despacho - Innovatech Chile

Aplicación frontend del módulo de despachos de Innovatech Chile.

## Tecnologías
- React / Vue
- Nginx
- Docker + Docker Compose
- GitHub Actions (CI/CD)

## Requisitos Previos
- Docker instalado

## Levantar con Docker Compose
```bash
docker-compose up -d
```

## Acceso
Una vez levantado, acceder desde el navegador:

http://localhost:80

En producción AWS:
http://3.91.16.212

## Pipeline CI/CD
El pipeline se activa automáticamente con push en la rama `deploy`:
1. Copia el código a S3
2. Build de la imagen Docker en EC2 via SSM
3. Push de la imagen a Amazon ECR
4. Deploy automático en la instancia front-ec2 (puerto 80)

## Arquitectura
- Frontend desplegado en subred pública (accesible desde Internet)
- Backend desplegado en subred privada (solo accesible internamente)
- Comunicación controlada mediante Security Groups de AWS

# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh
