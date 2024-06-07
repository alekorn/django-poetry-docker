# Dockerizing Django with Poetry, Postgres, Gunicorn, and Nginx
A project template based on a compilation of development experience using poetry and Docker.


## Usage Docker

### Dev
django development server + postgres or sqllite db
1. Rename file  __.env.dev-sample__  to  __.env.dev__.
2. Change env variables in the __.env.dev__ and __docker-compose.yml__ files.
3. Build docker images and run the containers:
   
	```
	make dev
	```
	or manually:
	```
	docker-compose up -d --build --remove-orphans
	```
5.  Go to  [http://localhost:8000](http://localhost:8000/). The __/app__ directory is mounted into the container. Your code changes apply automatically.

### Prod
nginx + gunicorn + postgres db
1. Rename file  __.env.prod-sample__  to  __.env.prod__.
2. Rename file __.env.prod.db-sample__ to __env.prod.db__.
3. Change env variables.
5. Build docker images and run the containers:
	```
	make prod
	```
	or manually:
	```
	docker-compose -f docker-compose.prod.yml up -d --build
	```
6.  Go to  [http://localhost:1234](http://localhost:1234/). No mounted directories. After changing code you need to rebuild image.

## Usage Poetry
You can run a project without using docker
1. Go to app.
	```
	cd app	
	```
2. Install dependencies.
	```
	make install
	```
3. Apply migrate.
	```
	make migrate
	```
4. Run django development server.
	```
	make runserver
	```
