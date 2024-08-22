FROM python:3.11-alpine3.20

RUN apk add --no-cache \
        gcc \
        musl-dev \
        libffi-dev && \
    mkdir -p /app && \
    pip install poetry==1.4.2 && \
    apk del \
        gcc \
        musl-dev \
        libffi-dev


WORKDIR /app

COPY pyproject.toml poetry.lock ./
ENV POETRY_VIRTUALENVS_PATH=/usr/src/.venv \
    POETRY_VIRTUALENVS_IN_PROJECT=0 \
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=1

RUN poetry install --no-root --no-cache

COPY entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]