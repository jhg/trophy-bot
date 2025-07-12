#!/bin/sh

touch json.sqlite
chmod 666 json.sqlite
touch example_db.json
chmod 666 example_db.json

if [ ! -d images ]; then
  mkdir images
  chmod 777 images
fi

action="$1"

case "$action" in
  build)
    docker-compose build
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
