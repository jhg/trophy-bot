#!/bin/sh

touch json.sqlite example_db.json
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
    echo "Unknown action: $action"
    exit 1
    ;;
esac
