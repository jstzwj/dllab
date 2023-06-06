JUPYTERHUB_DATA_PATH="./jupyterhub_data"
NOTEBOOK_DATA_PATH="./notebook_data"

docker ps -aq --filter name="jupyter-*"|xargs docker stop|xargs docker rm
docker ps -aq --filter name="deeplearning-*"|xargs docker stop|xargs docker rm

DOCKER_UID=1001 DOCKER_GID=998 DOCKER_USERNAME=xiaohanhan \
INTERNAL_UID=1002 INTERNAL_GID=100 INTERNAL_USERNAME=deeplearning \
HOST=0.0.0.0 \
JUPYTERHUB_DATA_PATH="$JUPYTERHUB_DATA_PATH" \
NOTEBOOK_DATA_PATH="$NOTEBOOK_DATA_PATH" \
docker-compose up --build --remove-orphans --force-recreate
# DOCKER_UID=1001 DOCKER_GID=1001 
