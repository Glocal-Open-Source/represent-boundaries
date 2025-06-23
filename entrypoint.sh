#!/bin/sh

echo "Running migrations..."
python3 manage.py migrate --noinput

echo "Starting Gunicorn..."
exec gunicorn my_project.wsgi:application --bind 0.0.0.0:8000
