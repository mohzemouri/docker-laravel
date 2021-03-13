# Docker development environment for Laravel :whale:

Included Features:

- Nginx
- MySQL
- PHP-FPM
- PHPMyAdmin
- Nodejs (including npm, yarn)
- Composer

## Setup

Requirements:

- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)

Before running `docker-compose up -d` for the first time, you need to run the following commands:

```bash
docker-compose run --rm php composer install
docker-compose run --rm node npm install
```

Now you can run:

```bash
docker-compose up -d
```
