# ETAPA 1: Construcción (Build)
# Usamos una imagen de Node ligera para compilar el proyecto
FROM node:18-alpine AS build

WORKDIR /app

# Copiamos solo archivos de dependencias para aprovechar el cache de Docker
COPY package*.json ./
RUN npm install

# Copiamos el resto del código y generamos la carpeta 'dist'
COPY . .
RUN npm run build

# ETAPA 2: Servidor de Producción (Servir los archivos estáticos)
# Usamos Nginx Alpine por ser extremadamente ligero y eficiente
FROM nginx:alpine

# Configuración de Mínimo Privilegio (IE1)
# Creamos archivos necesarios y damos permisos al usuario 'nginx'
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /var/log/nginx /etc/nginx/conf.d

# Cambiamos al usuario no-root 'nginx'
USER nginx

# Copiamos los archivos compilados desde la etapa anterior
# Vite genera por defecto la carpeta 'dist'
COPY --from=build /app/dist /usr/share/nginx/html

# Exponemos el puerto estándar para tráfico web
EXPOSE 80

# Nginx corre en primer plano
CMD ["nginx", "-g", "daemon off;"]