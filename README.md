# e-shop-dot
eShopDot - infra files for eShot demo

# Description
- e-shop-auth (Go) - SSO (phone/email/OTP)
    - Rest API / gRPC
    - MongoDB
    - Redis
    - RabbitMQ

- e-shop-notifier (Go) - notification via email or sms
    - RabbitMQ

- e-shop-collector (Node.js) - collect table data and save to Clickhouse
    - Rest API
    - Clickhouse

- e-shop-wrapper (Go) - can wrap request to Clickhouse (SQL)
    - Rest API
    - Clickhouse

- e-shop-cdn (Go) - files storage
    - Rest API
    - Minio
    - MongoDB

- e-shop-support-bot (Go) - integration with Telegram for support
    - Redis
    - PostgreSQL

Internal libs:
- e-shop-nodepack - shared code for Node.js
- e-shop-gopack - shared code for Go

# Use Cases

### User registration
- [ ] As User can register;

### User authorization:
- [ ] As User can log in via email w/ password;
- [ ] As User can log in via phone w/ OTP;
- [ ] Authorized user can change password;
- [ ] Authorized User can update profile info;
- [ ] Authorized User can update phone/email (only one per request);
- [ ] Authorized User can confirm new phone/email;
