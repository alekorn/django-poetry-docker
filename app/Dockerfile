FROM python:3.11-alpine3.20

RUN apk add --no-cache \
        shadow \
        gcc \
        musl-dev \
        libffi-dev && \
    adduser -D -h /home/user user && \
    mkdir -p /app && \
    chown user:user /app && \
    pip install poetry==1.4.2 && \
    apk del \
        shadow \
        gcc \
        musl-dev \
        libffi-dev


WORKDIR /app

COPY pyproject.toml poetry.lock ./
ENV POETRY_VIRTUALENVS_PATH=/usr/src/.venv \
    POETRY_VIRTUALENVS_IN_PROJECT=0
RUN poetry install --no-root --no-cache

COPY --chown=user:user entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

USER user

ENTRYPOINT ["./entrypoint.sh"]
