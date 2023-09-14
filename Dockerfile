FROM openjdk:17-jdk-slim
COPY **/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
