# Use official Java 21 runtime
FROM openjdk:21

# Copy built JAR into container
COPY target/java-maven-app-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
