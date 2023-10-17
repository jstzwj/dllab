JUPYTERHUB_DATA_PATH="${PWD}/jupyterhub_data"
NOTEBOOK_DATA_PATH="${PWD}/notebook_data"

docker ps -aq --filter name="jupyter-*"|xargs docker stop|xargs docker rm
docker ps -aq --filter name="deeplearning-*"|xargs docker stop|xargs docker rm

DOCKER_UID=1000 DOCKER_GID=1000 DOCKER_USERNAME=amax \
INTERNAL_UID=1000 INTERNAL_GID=1000 INTERNAL_USERNAME=deeplearning \
HOST=0.0.0.0 \
JUPYTERHUB_DATA_PATH="$JUPYTERHUB_DATA_PATH" \
NOTEBOOK_DATA_PATH="$NOTEBOOK_DATA_PATH" \
docker-compose up --build --remove-orphans --force-recreate
# DOCKER_UID=1001 DOCKER_GID=1001 
