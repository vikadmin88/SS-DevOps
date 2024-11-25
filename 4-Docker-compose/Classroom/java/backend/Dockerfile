FROM maven:3.8.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY pom.xml ./
COPY mvnw mvnw.cmd ./
COPY .mvn/ .mvn/

RUN chmod +x mvnw

COPY . .
RUN mvn clean package
# RUN ./mvnw clean package

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar ./app.jar

EXPOSE 8080

CMD ["java", "-jar", "./app.jar", "--server.port=8080"]