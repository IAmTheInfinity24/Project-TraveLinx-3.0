<div align="center">

# TraveLinx 3.0

### Flight reservation, passenger booking, PDF ticketing, and itinerary email delivery in one Spring Boot application.

![Java](https://img.shields.io/badge/Java-8-007396?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-2.6.3-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-Wrapper-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.x-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)

</div>

---

## Preview

TraveLinx 3.0 is a server-rendered flight reservation platform built with Spring Boot, JSP, Spring Data JPA, MySQL, and Bootstrap. It supports user registration, login, flight search, passenger reservation, PDF itinerary generation, and email delivery of tickets.

> Add application screenshots here after running the project locally.

| Landing Page | Reservation Flow | Ticket PDF |
| --- | --- | --- |
| `src/main/webapp/index.html` | `/flights/showCompleteReservation` | Generated during booking |

---

## What It Does

| Capability | Description |
| --- | --- |
| User onboarding | Register users and authenticate through the login form |
| Flight discovery | Search flights by origin, destination, and departure date |
| Passenger booking | Create reservations for one or more passengers |
| Ticket generation | Generate PDF itineraries using iText |
| Email delivery | Send reservation itinerary PDFs through SMTP |
| Reservation API | Fetch and update reservation data through REST endpoints |
| JSP UI | Render pages through Spring MVC and JSP views |

---

## Tech Stack

| Area | Technology |
| --- | --- |
| Language | Java 8 |
| Framework | Spring Boot 2.6.3 |
| Web | Spring MVC, JSP, JSTL, Bootstrap |
| Security | Spring Security |
| Persistence | Spring Data JPA, Hibernate |
| Database | MySQL 8.x |
| Mail | Spring Boot Mail, SMTP |
| PDF | iText 5 |
| Build Tool | Maven Wrapper |
| Container | Docker |

---

## Project Structure

```text
TraveLinx-3.0
|-- src
|   |-- main
|   |   |-- java/com/psa/flights_reservation_app_5
|   |   |   |-- controller/        # MVC and REST controllers
|   |   |   |-- dto/               # Reservation request objects
|   |   |   |-- entities/          # JPA entity models
|   |   |   |-- repository/        # Spring Data JPA repositories
|   |   |   |-- services/          # Business logic
|   |   |   |-- utilities/         # Email and PDF helpers
|   |   |   `-- Security/          # Security configuration
|   |   |-- resources
|   |   |   `-- application.properties
|   |   `-- webapp
|   |       |-- index.html
|   |       `-- WEB-INF/jsps/      # JSP screens
|   `-- test
|-- .mvn/wrapper
|-- Dockerfile
|-- pom.xml
|-- mvnw
|-- mvnw.cmd
`-- README.md
```

---

## Application Flow

```text
User Registration/Login
        |
        v
Dashboard
        |
        v
Search Flights
        |
        v
Select Flight
        |
        v
Enter Passenger Details
        |
        v
Create Reservation
        |
        v
Generate PDF Ticket + Send Email
```

---

## Prerequisites

Install these before running the project:

| Tool | Version |
| --- | --- |
| Java | 8 |
| MySQL | 8.x recommended |
| Maven | Not required globally, wrapper is included |
| Docker | Optional |

Check Java:

```powershell
java -version
```

---

## Configuration

The app reads its main settings from:

```text
src/main/resources/application.properties
```

Default runtime settings:

| Setting | Value |
| --- | --- |
| App URL | `http://localhost:9090/flights` |
| Server port | `9090` |
| Context path | `/flights` |
| Database | `flightsDB` |
| Hibernate DDL | `update` |
| View prefix | `/WEB-INF/jsps/` |
| View suffix | `.jsp` |

Recommended environment overrides:

```powershell
$env:SPRING_DATASOURCE_URL="jdbc:mysql://localhost:3306/flightsDB?createDatabaseIfNotExist=true"
$env:SPRING_DATASOURCE_USERNAME="root"
$env:SPRING_DATASOURCE_PASSWORD="your-db-password"
$env:SPRING_MAIL_USERNAME="your-email@example.com"
$env:SPRING_MAIL_PASSWORD="your-mail-app-password"
```

Keep real passwords and mail app passwords out of committed files.

---

## Database Setup

Create the database manually, or let the configured JDBC URL create it automatically:

```sql
CREATE DATABASE flightsDB;
```

Spring Data JPA is configured with:

```properties
spring.jpa.hibernate.ddl-auto=update
```

That means tables are created or updated automatically from the JPA entities when the application starts.

---

## Run Locally

Clone the project and move into the repository:

```powershell
git clone <repository-url>
cd Project-TraveLinx-3.0
```

Start MySQL, then run:

```powershell
.\mvnw.cmd spring-boot:run
```

Open:

```text
http://localhost:9090/flights
```

---

## Build

Create a production jar:

```powershell
.\mvnw.cmd clean package
```

Expected output:

```text
target/flight_reservation_app_5-0.0.1-SNAPSHOT.jar
```

Run the packaged jar:

```powershell
java -jar target/flight_reservation_app_5-0.0.1-SNAPSHOT.jar
```

---

## Docker

Build the image:

```powershell
docker build -t travelinx:3.0 .
```

Run the container:

```powershell
docker run --rm -p 9090:9090 `
  -e SPRING_DATASOURCE_URL="jdbc:mysql://host.docker.internal:3306/flightsDB?createDatabaseIfNotExist=true" `
  -e SPRING_DATASOURCE_USERNAME="root" `
  -e SPRING_DATASOURCE_PASSWORD="your-db-password" `
  -e SPRING_MAIL_USERNAME="your-email@example.com" `
  -e SPRING_MAIL_PASSWORD="your-mail-app-password" `
  travelinx:3.0
```

Open:

```text
http://localhost:9090/flights
```

---

## Main Routes

| Method | Route | Description |
| --- | --- | --- |
| `GET` | `/flights` | Landing page |
| `GET` | `/flights/showReg` | Registration page |
| `POST` | `/flights/saveReg` | Save registered user |
| `GET` | `/flights/showLoginPage` | Login page |
| `POST` | `/flights/verifyLogin` | Verify login credentials |
| `GET` | `/flights/dashboard` | User dashboard |
| `GET` | `/flights/findFlights` | Search available flights |
| `GET` | `/flights/showCompleteReservation` | Reservation form for a selected flight |
| `POST` | `/flights/confirmReservation` | Confirm reservation and generate itinerary |
| `GET` | `/flights/reservation/{id}` | Fetch reservation details |
| `POST` | `/flights/reservation` | Update reservation |

---

## Key Packages

| Package | Purpose |
| --- | --- |
| `controller` | Handles web and REST requests |
| `entities` | Defines database-backed domain models |
| `repository` | Provides JPA data access |
| `services` | Coordinates booking and user logic |
| `utilities` | Generates PDFs and sends emails |
| `Security` | Configures Spring Security behavior |

---

## Generated Files

During reservation processing, the application creates PDF tickets.

Ignored generated paths:

```text
tickets/*.pdf
src/main/resources/tickets/*.pdf
src/main/resources/tickets/
```

These files should stay out of Git because they are runtime artifacts.

---

## Security Notes

- The current security configuration permits all routes.
- Move credentials out of `application.properties` before sharing or deploying.
- Rotate any SMTP app password that has already been committed.
- Avoid committing generated PDF tickets with passenger data.

---

## Troubleshooting

| Issue | Fix |
| --- | --- |
| `JAVA_HOME is set to an invalid directory` | Install Java 8 and update `JAVA_HOME` |
| MySQL connection refused | Start MySQL and verify port `3306` |
| Access denied for database user | Check `SPRING_DATASOURCE_USERNAME` and `SPRING_DATASOURCE_PASSWORD` |
| Emails not sending | Use a valid SMTP account and app password |
| PDF path error | Ensure the ticket output directory exists and is writable |
| Port already in use | Change `server.port` or stop the process using `9090` |

---

## Development Commands

```powershell
# Run the app
.\mvnw.cmd spring-boot:run

# Build jar
.\mvnw.cmd clean package

# Run tests
.\mvnw.cmd test

# Build Docker image
docker build -t travelinx:3.0 .
```

---

## Repository Hygiene

This project includes a `.gitignore` for:

- Maven build output
- Java binaries
- IDE files
- logs and temporary files
- local environment files
- generated ticket PDFs
- Docker scratch files

---

<div align="center">

### TraveLinx 3.0

Built for flight booking workflows with Spring Boot, MySQL, JSP, PDF generation, and SMTP ticket delivery.

</div>
