# Use official Java 21 runtime
FROM openjdk:21

# Copy fat JAR into container
COPY target/java-maven-app-1.0-SNAPSHOT.jar app.jar

# Expose Spring Boot's default port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
