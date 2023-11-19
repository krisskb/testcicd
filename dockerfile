from openjdk:18-jdk-alpine
EXPOSE 8080
WORKDIR /app
COPY ./target/spring-petclinic-3.1.0-SNAPSHOT.jar ./petclinic.jar
CMD ["java", "-jar", "petclinic.jar"]
