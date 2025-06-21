FROM ghcr.io/osgeo/gdal:alpine-normal-3.8.2

RUN apk add --no-cache \
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

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
