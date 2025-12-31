# E-Commerce Microservices Application

A comprehensive microservices-based e-commerce application built with Spring Boot, featuring event-driven architecture using Kafka, distributed tracing with Zipkin, and email notifications.

## 🏗️ Architecture

This application follows a microservices architecture pattern with the following services:

- **Customer Service** - Manages customer information
- **Order Service** - Handles order processing and management
- **Payment Service** - Processes payments
- **Notification Service** - Sends email notifications for orders and payments
- **Product Service** - Manages product catalog
- **Gateway Service** - API Gateway for routing requests
- **Config Service** - Centralized configuration management
- **Discovery Service** - Service discovery using Eureka

## 🛠️ Technology Stack

- **Backend Framework**: Spring Boot 3.x
- **Language**: Java 17+
- **Database**: 
  - PostgreSQL (Order, Product, Payment services)
  - MongoDB (Customer, Notification services)
- **Message Broker**: Apache Kafka
- **Service Discovery**: Spring Cloud Netflix Eureka
- **API Gateway**: Spring Cloud Gateway
- **Distributed Tracing**: Zipkin
- **Email Testing**: MailDev
- **Containerization**: Docker & Docker Compose

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

- **Docker Desktop** (version 20.10 or higher)
- **Docker Compose** (version 2.0 or higher)
- **Java JDK** 17 or higher
- **Maven** 3.8+ or **Gradle** 7.5+
- **Git**

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd ecommerce-microservices
```

### 2. Start Infrastructure Services

Start all required infrastructure services using Docker Compose:

```bash
docker-compose up -d
```

This will start:
- PostgreSQL database
- MongoDB database
- Apache Kafka with Zookeeper
- Zipkin for distributed tracing
- MailDev for email testing
- pgAdmin for PostgreSQL management
- Mongo Express for MongoDB management

### 3. Verify Services are Running

Check that all containers are running:

```bash
docker-compose ps
```

You should see all services with status "Up".

### 4. Start Spring Boot Microservices

Start the services in the following order:

```bash
# 1. Start Config Service
cd services/config-service
mvn spring-boot:run

# 2. Start Discovery Service
cd services/discovery-service
mvn spring-boot:run

# 3. Start Gateway Service
cd services/gateway-service
mvn spring-boot:run

# 4. Start Business Services (in parallel)
cd services/customer-service && mvn spring-boot:run &
cd services/product-service && mvn spring-boot:run &
cd services/order-service && mvn spring-boot:run &
cd services/payment-service && mvn spring-boot:run &
cd services/notification-service && mvn spring-boot:run &
```

## 🌐 Service Ports & URLs

### Infrastructure Services

| Service | Port | Access URL | Credentials |
|---------|------|------------|-------------|
| PostgreSQL | 5432 | localhost:5432 | admin / admin |
| pgAdmin | 5050 | http://localhost:5050 | pgadmin@pgadmin.org / admin |
| MongoDB | 27017 | localhost:27017 | admin / admin |
| Mongo Express | 8081 | http://localhost:8081 | admin / admin |
| Kafka | 9092 | localhost:9092 | - |
| Zookeeper | 2181 | localhost:2181 | - |
| Zipkin | 9411 | http://localhost:9411 | - |
| MailDev Web UI | 1080 | http://localhost:1080 | - |
| MailDev SMTP | 1025 | localhost:1025 | - |

### Application Services

| Service | Port | Description |
|---------|------|-------------|
| Config Service | 8888 | Centralized configuration |
| Discovery Service | 8761 | Eureka server |
| Gateway Service | 8080 | API Gateway |
| Customer Service | 8090 | Customer management |
| Product Service | 8050 | Product catalog |
| Order Service | 8070 | Order processing |
| Payment Service | 8060 | Payment processing |
| Notification Service | 8040 | Email notifications |

## 📊 Database Configuration

### PostgreSQL Databases

The following databases are created automatically:

- `customer` - Customer service database
- `order` - Order service database
- `product` - Product service database
- `payment` - Payment service database

**Access via pgAdmin:**
1. Open http://localhost:5050
2. Login with `pgadmin@pgadmin.org` / `admin`
3. Add new server:
   - Host: `postgres` (or `ms_pg_sql`)
   - Port: `5432`
   - Username: `admin`
   - Password: `admin`

### MongoDB Database

The notification service uses MongoDB to store notification history.

**Access via Mongo Express:**
1. Open http://localhost:8081
2. Login with `admin` / `admin`
3. View the `customer` database

## 📨 Kafka Topics

The application uses the following Kafka topics:

- `payment-topic` - Payment confirmation notifications
- `order-topic` - Order confirmation notifications

## 🧪 Testing the Application

### 1. View Email Notifications

All emails are captured by MailDev:
1. Open http://localhost:1080
2. You'll see all emails sent by the notification service

### 2. Monitor Distributed Tracing

View request traces across microservices:
1. Open http://localhost:9411
2. Click "Run Query" to see recent traces

### 3. Check Service Health

Access the Eureka Dashboard to see all registered services:
- http://localhost:8761

### 4. Sample API Requests

#### Create a Customer
```bash
curl -X POST http://localhost:8080/api/v1/customers \
  -H "Content-Type: application/json" \
  -d '{
    "firstname": "John",
    "lastname": "Doe",
    "email": "john.doe@example.com"
  }'
```

#### Create an Order
```bash
curl -X POST http://localhost:8080/api/v1/orders \
  -H "Content-Type: application/json" \
  -d '{
    "customerId": 1,
    "reference": "ORD-001",
    "products": [
      {
        "productId": 1,
        "quantity": 2
      }
    ]
  }'
```

## 🐛 Troubleshooting

### Services not connecting to Kafka

If services can't connect to Kafka:
```bash
# Restart Kafka and Zookeeper
docker-compose restart zookeeper kafka
```

### Database connection errors

Check if PostgreSQL is running:
```bash
docker logs ms_pg_sql
```

### Port already in use

If a port is already in use, stop the conflicting service or modify the port in `docker-compose.yml`.

### Clear all data and restart

To reset everything:
```bash
# Stop all containers
docker-compose down

# Remove volumes (⚠️ This deletes all data)
docker-compose down -v

# Start fresh
docker-compose up -d
```

## 📁 Project Structure

```
ecommerce-microservices/
├── docker-compose.yml
├── services/
│   ├── config-service/
│   ├── discovery-service/
│   ├── gateway-service/
│   ├── customer-service/
│   ├── product-service/
│   ├── order-service/
│   ├── payment-service/
│   └── notification-service/
└── README.md
```

## 🔧 Configuration

### Spring Cloud Config

All service configurations are centralized in the config-service. Configuration files should be placed in:
```
config-service/src/main/resources/configurations/
```

### Environment Variables

You can override default configurations using environment variables:

```bash
# Example: Change PostgreSQL password
POSTGRES_PASSWORD=your_password docker-compose up -d
```

## 📝 API Documentation

Once the services are running, you can access API documentation (if Swagger is configured):

- Gateway Service: http://localhost:8080/swagger-ui.html
- Customer Service: http://localhost:8090/swagger-ui.html
- Order Service: http://localhost:8070/swagger-ui.html
- Payment Service: http://localhost:8060/swagger-ui.html

## 🛑 Stopping the Application

### Stop all Docker containers
```bash
docker-compose down
```

### Stop and remove all data
```bash
docker-compose down -v
```

### Stop Spring Boot services
Press `Ctrl+C` in each terminal running a Spring Boot service.

## 📚 Additional Resources

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Spring Cloud Documentation](https://spring.io/projects/spring-cloud)
- [Apache Kafka Documentation](https://kafka.apache.org/documentation/)
- [Docker Documentation](https://docs.docker.com/)

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👤 Author

Helal Omar

## 🙏 Acknowledgments

- Spring Boot team for the excellent framework
- Confluent for Kafka
- All open-source contributors

---

**Happy Coding! 🚀**
