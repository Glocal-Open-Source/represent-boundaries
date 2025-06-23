FROM ghcr.io/osgeo/gdal:alpine-normal-3.8.2

RUN apk add --no-cache \
    tzdata \
    python3 \
    py3-pip \
    python3-dev \
    postgresql-dev \
    gcc \
    musl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    geos-dev

WORKDIR /app

COPY requirements.txt /app/
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

COPY . /app/

# EXPOSE 8000

# # CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
# CMD ["gunicorn", "my_project.wsgi:application", "--bind", "0.0.0.0:8000"]

# Add entrypoint for running migrations then starting the app
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
