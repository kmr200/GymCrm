# Gym Management Microservices

## Overview

This project is a **microservices-based Gym Management System** developed during my internship at **EPAM Systems**. It consists of two microservices:

- **Main Microservice** – Handles user authentication, profiles, and training sessions.
- **Report Microservice** – Manages trainer workload reports.

Both microservices share a **single Redis instance** for caching but can be decoupled if needed.

## Architecture

<img width="516" alt="image" src="https://github.com/user-attachments/assets/b3c74dc1-0aa4-4232-8a8f-bd0e44096c3e" />

## Authentication

The application uses **JWT-based authentication**:

1. Users log in using **form-based authentication**.
2. Upon successful authentication, a **JWT token** is generated.
3. The token must be included in the **Authorization header** for subsequent requests.

## Tech Stack

- **Spring Framework**:
  - Spring Boot
  - Spring Data (JPA, Redis)
  - Spring Cloud (Netflix Eureka, Feign Client)
  - Spring Security (JWT-based authentication)
- **Database**:
  - **Main Microservice**: MySQL (relational database)
  - **Report Microservice**: NoSQL (stores trainer workload reports)
- **Caching**:
  - **Redis (AWS ElastiCache)** for performance optimization.
- **Message Queue**:
  - **AWS SQS** for async communication between microservices.
- **Testing**:
  - Unit Tests
  - Integration Tests using **SpringBootTest**
  - BDD-style **Cucumber Integration Tests**
- **Mapping Layer**:
  - **MapStruct** for DTO to entity mapping.

## Microservices Overview

### 1. Main Microservice

- Manages user data including:
  - **Login credentials** (passwords stored using **BCrypt hashing**).
  - **Trainer & Trainee profiles**.
  - **Training session management**.
- Stores data in **MySQL**.

### 2. Report Microservice

- Manages **trainer workload reports**.
- Stores data in **NoSQL database**.

## Setup & Deployment

### Prerequisites

- **JDK 17+**
- **Docker & Docker Compose** (for local setup)
- **AWS ElastiCache Redis** (if running in the cloud)
- **MySQL & NoSQL database**

---

