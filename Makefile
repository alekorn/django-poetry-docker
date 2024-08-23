.PHONY: dev prod poetry migrations migrate

dev:
	docker-compose up -d --build --remove-orphans

prod:
	docker-compose -f docker-compose.prod.yml up -d --build --remove-orphans

poetry:
	docker-compose exec web poetry $(filter-out $@,$(MAKECMDGOALS))
# ignore all commands after poetry command
%: 
	@:

migrations:
		docker-compose exec web poetry run python manage.py makemigrations

migrate:
		docker-compose exec web poetry run python manage.py migrate
