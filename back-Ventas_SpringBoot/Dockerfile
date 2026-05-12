# ETAPA 1: Construcción (Build)
# Usamos una imagen de Maven con JDK 17 para compilar el código fuente [cite: 310]
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app

# Copiamos el pom.xml y descargamos dependencias (optimiza el caché de capas) [cite: 310]
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos el código fuente y generamos el archivo .jar omitiendo los tests
COPY src ./src
RUN mvn clean package -DskipTests

# ETAPA 2: Ejecución (Runtime) [cite: 248, 310]
# Usamos el JRE de Java 17, que es más liviano y seguro para AWS [cite: 360]
FROM openjdk:17-jdk-slim
WORKDIR /app

# CONFIGURACIÓN DE SEGURIDAD: Usuario no-root (Mínimo privilegio) [cite: 232, 310]
RUN addgroup --system ventasgroup && adduser --system ventasuser --ingroup ventasgroup
USER ventasuser

# Copiamos el artefacto .jar desde la etapa de construcción [cite: 310]
COPY --from=build /app/target/*.jar app.jar

# Exponemos el puerto interno del contenedor (Spring Boot usa 8080 por defecto) [cite: 250, 312]
EXPOSE 8080

# Comando para iniciar la aplicación [cite: 279]
ENTRYPOINT ["java", "-jar", "app.jar"]