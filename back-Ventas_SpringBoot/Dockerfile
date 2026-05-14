# ETAPA 1: Construcción (Build)
FROM maven:3.8.8-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# ETAPA 2: Ejecución (Runtime)
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
RUN addgroup --system ventasgroup && adduser --system ventasuser --ingroup ventasgroup
USER ventasuser
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
