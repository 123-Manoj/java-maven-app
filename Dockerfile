# Use official Java 21 runtime
FROM openjdk:21-jdk-slim

# Copy built JAR into container
COPY target/*.jar app.jar

EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
