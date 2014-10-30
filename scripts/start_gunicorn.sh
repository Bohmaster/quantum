#!/bin/bash

NAME="amentia"
DJANGODIR=/home/andres/projects/amentia/amentia
VIRTUAL_ENV=/home/andres/.virtualenvs/amentia
USER=andres
GROUP=andres
NUM_WORKERS=2
DJANGO_SETTINGS_MODULE=amentia.settings.prod
DJANGO_WSGI_MODULE=amentia.wsgi
IP=0.0.0.0
PORT=8000

echo "Starting $NAME"

source $VIRTUAL_ENV/bin/activate
export PYTHONPATH=$VIRTUAL_ENV:$PYTHONPATH
echo $PYTHONPATH



exec $VIRTUAL_ENV/bin/gunicorn $DJANGO_WSGI_MODULE \
  --name $NAME \
  --bind=$IP:$PORT \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --log-level=debug \
  --env DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE \
  --chdir $DJANGODIR
