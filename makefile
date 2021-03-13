.PHONY: clean install

install:
	git clone https://github.com/laravel/laravel laravel
	rm -rf laravel/.git laravel/README.md laravel/CHANGELOG.md laravel/.env.example
	cp -r laravel/. .
	rm -rf laravel
	cp .env.example .env
	docker-compose run --rm php composer install
	docker-compose run --rm node npm install

clean:
	rm -rf .git

build: clean install
