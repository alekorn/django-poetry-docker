# Dockerizing Django with Poetry, Postgres, Gunicorn, and Nginx
A project template based on a compilation of development experience using poetry and Docker.


## Usage Docker

### Dev
django development server + postgres or sqllite db
1. Rename env files _.env.dev-sample_ to _.env.dev_:

	```
	$ mv .env.dev-sample .env.dev
	```
2. Change env variables in the _.env.dev_ and _docker-compose.yml_ files.
3. Build docker images and run the containers:
   
	```
	$ make dev
	```
	or manually:
	```
	$ docker-compose up -d --build --remove-orphans
	```
4.  Go to  [http://localhost:8000](http://localhost:8000/). The _/app_ directory is mounted into the container. Your code changes apply automatically.

### Prod
nginx + gunicorn + postgres db
1. Rename file _.env.prod-sample_ to _.env.prod_ and _.env.prod.db-sample_ to _env.prod.db_:

	```
	$ mv .env.prod-sample .env.prod && mv .env.prod.db-sample .env.prod.db
	```
2. Change env variables.
3. Build docker images and run the containers:

	```
	$ make prod
	```
	or manually:
	```
	$ docker-compose -f docker-compose.prod.yml up -d --build
	```
4.  Go to  [http://localhost:1234](http://localhost:1234/). No mounted directories. After changing code you need to rebuild image.

## Usage Poetry
Use `$ make poetry [command]` to run any poetry commands in dev container (see Makefile) 	
### Examples:
 - Add package
   
   	```
	$ make poetry add cowsay
	```
 - Check package in pip list
   
   	```
	$ make poetry run pip3 list | grep cowsay
	```
 - Remove package
   
	```
	$ make poetry remove cowsay
	```
 	```
 - Create migrations
   
	```
	$ make migrations
	```
 	```
 - Apply migrations
   
	```
	$ make migrate
	```
