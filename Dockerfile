# Use OpenJDK base image
FROM openjdk:8-jdk-alpine

# Set working directory
WORKDIR /app

# Copy jar file from Maven target folder into container
COPY target/java-maven-app-1.0-SNAPSHOT.jar app.jar

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
