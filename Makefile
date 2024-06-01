setup:
	@make build
	@make up
	@make composer-update
	@make create-laravel-app
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
down:
	docker-compose down
ps:
	docker-compose ps
exec:
	docker exec -it laravel-docker bash
create-laravel-app:
	docker exec -it laravel-docker bash -c "composer create-project laravel/laravel ."
composer-update:
	docker exec -it laravel-docker bash -c "composer update"
data:
	docker exec -it laravel-docker bash -c "php artisan migrate"
	docker exec -it laravel-docker bash -c "php artisan db:seed"
	docker exec -it laravel-docker bash -c "php artisan serve --host=0.0.0.0 --port=8080"
breeze-authentication:
	docker exec -it laravel-docker bash -c "composer require laravel/breeze --dev"
node-install:
	apt install nodejs
	node -v
	apt install npm
	npm -v
	npm install
	npm run dev
	php artisan breeze:install
	php artisan migrate
node-upgrade:
	npm cache clean --force
	npm install -g n
	n latest
	node -v
remove-node:
	rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* ~/.npm && rm -rf /usr/local/lib/node* &
& rm -rf /usr/local/bin/node* && rm -rf /usr/local/include/node* && apt-get purge nodejs npm && apt autoremove
	