# ETAPA 1: Construcción (Maven)
# Usamos una imagen de Maven para compilar el código fuente y generar el .jar
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app

# Copiamos el archivo de configuración de dependencias
COPY pom.xml .
# Descargamos las dependencias (esto ayuda a que el Pipeline CI/CD sea más rápido)
RUN mvn dependency:go-offline

# Copiamos el código fuente y compilamos el proyecto omitiendo los tests para ganar velocidad
COPY src ./src
RUN mvn clean package -DskipTests

# ETAPA 2: Ejecución (Imagen Ligera)
# Usamos el JRE (Java Runtime Environment) que es mucho más pequeño que el JDK
FROM openjdk:17-jdk-slim
WORKDIR /app

# Mínimo Privilegio (IE1): Creamos un usuario de sistema para no correr como root
RUN addgroup --system spring && adduser --system spring --ingroup spring
USER spring

# Copiamos el archivo .jar generado en la etapa anterior
# Nota: Asegúrate de que el nombre coincida con el generado por tu pom.xml
COPY --from=build /app/target/*.jar app.jar

# Exponemos el puerto estándar de Spring Boot
EXPOSE 8080

# Comando para iniciar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]