.PHONY: dev prod

dev:
	docker-compose up -d --build --remove-orphans
prod:
	docker-compose -f docker-compose.prod.yml up -d --build --remove-orphans
