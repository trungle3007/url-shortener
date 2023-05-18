# URL Shortener Service

This service implements an API endpoint which is to shorten a URL based on the theoretical background of the [Bijective](https://en.wikipedia.org/wiki/Bijection) function.

## Prerequisites

You need to instal the following tools before starting the setup instruction:

- Docker
- Docker Compose (Optional)

## Setup instruction

Open the Terminal and follow these steps to run the app:

- Step 1: Build a Docker image:

```
docker build -t urlshortener .
```

- Step 2: Specify environment variables. Please refer to `.env` file for default values. This app uses PostgreSQL so you need to specify the `POSTGRES_URL` in the `.env` file.

- Step 3: Start a container

```
docker run --name urlshortener -p "9292:9292" --env-file .env -d urlshortener
```

## Usage

1. To shorten a URL:
```
curl -X POST http://localhost:9292/api/shorten -H 'Content-Type: application/json' -d '{ "url": "https://www.mongodb.com/docs/mongoid/current/reference/queries/#condition-syntax" }'
```

2. You will receive a shortened URL:
```
{"shortened_url":"http://localhost:9292/f"}
```

3. Open the shortened url on your web browser and see the result.

## Real-life problem of building URL shortener service

- Scalability and performance: As the business grows, it needs to handle an inreasing number of requests efficiently. Handling a large volume of concurrent requests and ensuring low latency can be challenging, requiring robust infrastructure, load balancing techniques, and optimizations to maintain optimal performance.
- Link management and maintenance: Managing and maintaining a vast database of shortened URLs can become complex over time. It involves handling link creation, expiration, deletion, and tracking the usage and analytics associated with each link. Efficient indexing and storage mechanisms are crucial to handle a potentially large number of links.
- Security and abuse prevention: URL shortener services are attractive targets for abuse, spam, and malicious activities. It is essential to implement security measures to prevent the creation and distribution of harmful or fraudulent links. This may involve incorporating link scanning mechanisms, implementing CAPTCHA or other authentication methods, and monitoring user behavior for suspicious activities.

