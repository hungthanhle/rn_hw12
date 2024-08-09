#!/bin/bash

# Check the arguments
if [ $# -ne 2 ]; then
  echo "Format command: $0 <container_name> <command>"
  echo "Example: $0 mysql up"
  exit 1
fi

CONTAINER_NAME="$1"
COMMAND="$2"

# Container already exists. # docker run --name mysql -e MYSQL_ROOT_PASSWORD=pw -d mysql:latest
if docker ps -a --format '{{.Names}}' | grep -E "^$CONTAINER_NAME$"; then
  case "$COMMAND" in
    up)
      docker start $CONTAINER_NAME
      echo "$CONTAINER_NAME started."
      ;;
    down)
      docker stop $CONTAINER_NAME
      echo "$CONTAINER_NAME stopped."
      ;;
    restart)
      docker restart $CONTAINER_NAME
      echo "$CONTAINER_NAME restarted."
      ;;
    *)
      echo "Invalid command. Please try: up, down, restart"
      ;;
  esac
else
  echo "Not found container $CONTAINER_NAME."
fi
