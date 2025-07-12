#!/bin/sh

$action="$1"

switch ($action) {
  case "build":
    docker-compose build
    ;;
  case "up":
    docker-compose up -d
    ;;
  case "down":
    docker-compose down
    ;;
  case "logs":
    docker-compose logs -f
    ;;
  default:
    echo "Unknown action: $action"
    exit 1
    ;;
}
