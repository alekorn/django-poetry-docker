.PHONY: runserver migrate migrations

ENV_VARS=SECRET_KEY=foo DEBUG=1 DJANGO_ALLOWED_HOSTS=127.0.0.1

runserver:
	$(ENV_VARS) poetry run python manage.py runserver 8001
migrate:
	$(ENV_VARS) poetry run python manage.py migrate
migrations:
	$(ENV_VARS) poetry run python manage.py makemigrations