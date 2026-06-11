FROM maven:3.8.8-eclipse-temurin-8 AS build

WORKDIR /workspace

COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY src ./src
RUN mvn -B clean package -DskipTests

FROM eclipse-temurin:8-jre

WORKDIR /app

RUN mkdir -p /app/src/main/resources/tickets /app/tickets \
    && chown -R 10001:10001 /app

COPY --from=build /workspace/target/flight_reservation_app_5-0.0.1-SNAPSHOT.jar /app/app.jar

ENV SERVER_PORT=9090

EXPOSE 9090

USER 10001

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
