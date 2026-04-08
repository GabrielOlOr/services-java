# Usar una imagen base ligera de Java 21
FROM eclipse-temurin:21-jdk-alpine
# Copiar el archivo JAR generado por Gradle al contenedor
COPY build/libs/*.jar app.jar
# Exponer el puerto por defecto de Spring Boot
EXPOSE 8080
# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app.jar"]