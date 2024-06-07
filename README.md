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
5.  Go to  [http://localhost:8000](http://localhost:8000/). The _/app_ directory is mounted into the container. Your code changes apply automatically.

### Prod
nginx + gunicorn + postgres db
1. Rename file _.env.prod-sample_ to _.env.prod_ and _.env.prod.db-sample_ to _env.prod.db_:

	```
	$ mv .env.prod-sample .env.prod
	$ mv .env.prod.db-sample .env.prod.db
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
You can run a project without using docker
1. Go to app:

	```
	$ cd app	
	```
2. Install dependencies:

	```
	$ make install
	```
3. Apply migratons:

	```
	$ make migrate
	```
4. Run django development server:

	```
	$ make runserver
	```
6.  Go to  [http://localhost:8001](http://localhost:8001/). Docker is not used. Working with code directly.

When using Poetry, command line variables are used to avoid conflicts with environment variables defined in .env files.
