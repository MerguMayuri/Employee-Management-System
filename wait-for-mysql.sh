#!/bin/sh

echo "⏳ Waiting for MySQL to start on db:3306..."

while ! nc -z db 3306; do
  sleep 2
done

echo "✅ MySQL is up - starting Spring Boot application..."
exec java -jar /app/app.jar
