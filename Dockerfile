FROM python:3.12.5-alpine3.20

COPY ./requirements.txt /tmp/requirements.txt
COPY ./qualidade /app
COPY ./qualidade/manage.py /app/manage.py

WORKDIR /app

EXPOSE 8080

RUN python -m venv /py && \
    pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client &&\
    apk add --update --no-cache --virtual .tmp-buil-deps \
      build-base postgresql-dev musl-dev && \
    pip install -r /tmp/requirements.txt

ENV PATH="py/bin:$PATH"



