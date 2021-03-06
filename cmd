#!/usr/bin/env bash

if [ $# -gt 0 ]; then

    if [ "$1" == "rebuild" ]; then
        docker-compose up --build -d

    elif [ "$1" == "start" ]; then
        docker-compose up -d

    elif [ "$1" == "stop" ]; then
        docker-compose stop
    
    elif [ "$1" == "remove" ]; then
        docker-compose down -v

    elif [ "$1" == "logs" ]; then
       docker-compose logs -f -t

    elif [ "$1" == "stats" ]; then
       docker stats $(docker inspect -f '{{.Name}}' $(docker ps -q) | cut -c 2-)

    elif [ "$1" == "artisan" ] || [ "$1" == "art" ]; then
        shift 1
        docker-compose exec \
            php \
            php artisan "$@"
    elif [ "$1" == "mysql" ]; then
        shift 1
        docker-compose exec \
            mysql \
            bash -c 'MYSQL_PWD=$MYSQL_ROOT_PASSWORD mysql -u root $MYSQL_DATABASE'

    elif [ "$1" == "composer" ] || [ "$1" == "comp" ]; then
        shift 1
        docker-compose exec \
            php \
            composer "$@"      

    elif [ "$1" == "npm" ]; then
        shift 1
        docker-compose run --rm \
            node \
            npm "$@"

    elif [ "$1" == "yarn" ]; then
        shift 1
        docker-compose run --rm \
            node \
            yarn "$@"

    elif [ "$1" == "exec" ]; then
        shift 1
        docker exec -it "$@"

    else
        docker-compose "$@"
    fi

else
    docker-compose ps
fi