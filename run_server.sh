#!/bin/bash

python3 ./matfyz_forum/manage.py makemigrations
python3 ./matfyz_forum/manage.py migrate

python3 ./matfyz_forum/manage.py runserver 0.0.0.0:8000