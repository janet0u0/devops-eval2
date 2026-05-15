# ETAPA 1: Construcción
FROM maven:3.8.8-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
# Descarga dependencias para aprovechar la caché de Docker
RUN mvc dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# ETAPA 2: Ejecución
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
# Copia el jar generado desde la etapa de construcción
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
