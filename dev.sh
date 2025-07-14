#!/bin/sh

touch json.sqlite example_db.json .env
chmod 666 json.sqlite example_db.json

if [ ! -d images ]; then
  mkdir images
  chmod 777 images
fi

action="$1"

case "$action" in
  build)
    docker-compose build
    ;;
  clean)
    docker-compose down --rmi all
    ;;
  run)
    docker-compose up
    ;;
  up)
    docker-compose up -d
    ;;
  down)
    docker-compose down
    ;;
  logs)
    docker-compose logs -f
    ;;
  *)
    docker-compose down --rmi all
    docker-compose build
    docker-compose up
    docker-compose down --rmi all
    ;;
esac
