# Etapa 1: Construcción (Build)
FROM eclipse-temurin:21-jdk-jammy AS build
WORKDIR /app

# Copiar archivos de configuración de Gradle
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# Descargar dependencias (esto ayuda a cachear las capas de Docker)
RUN chmod +x gradlew
RUN ./gradlew dependencies --no-daemon

# Copiar el código fuente y compilar el proyecto
COPY src src
RUN ./gradlew bootJar --no-daemon

# Etapa 2: Imagen de ejecución (Runtime)
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Crear un usuario de sistema para no correr la app como root (Seguridad)
RUN addgroup --system javauser && adduser --system --ingroup javauser javauser
USER javauser

# Copiar el archivo JAR generado en la etapa de construcción
COPY --from=build /app/build/libs/*.jar app.jar

# Exponer el puerto por defecto de Spring Boot
EXPOSE 8080

# Comando para iniciar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]