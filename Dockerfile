# PURPOSE: This Dockerfile defines how to package the Spring Boot "Fat JAR" and its
# embedded web server into a single, isolated container image.

# It ensures consistency across environments by locking in the Java runtime (JRE) version
# and providing a predictable execution path, allowing the application to run
# anywhere Docker is installed without manual server setup.

# 1. Use an official Java Runtime as the base image
FROM eclipse-temurin:21-jre

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the "Fat JAR" (which includes the embedded server) into the container
# Note: Ensure you run 'mvn clean package' before building this!
COPY target/*.jar app.jar

# 4. Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]