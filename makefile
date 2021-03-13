.PHONY: clean install

install:
	git clone https://github.com/laravel/laravel temp
	rm -rf temp/.git temp/README.md temp/CHANGELOG.md temp/.env.example
	cp -r temp/. .
	rm -rf temp
	cp .env.example .env
	docker-compose run --rm php composer install
	docker-compose run --rm node npm install

clean:
	rm -rf .git

build: clean install
