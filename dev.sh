#!/bin/sh

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
