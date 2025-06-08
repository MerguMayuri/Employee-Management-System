# Stage 1: Build the application
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# Install netcat (for wait-for-mysql.sh script)
RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# Copy JAR and wait script from build context
COPY --from=build /app/target/*.jar app.jar
COPY wait-for-mysql.sh wait-for-mysql.sh

# Give execution permission to the script
RUN chmod +x wait-for-mysql.sh

EXPOSE 8080

# Use the wait script as the entry point
ENTRYPOINT ["./wait-for-mysql.sh"]
