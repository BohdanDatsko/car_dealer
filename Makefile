
migrations:
	@docker exec -it -w /car_dealer car_dealer_api python src/manage.py makemigrations

migrate:
	@docker exec -it -w /car_dealer car_dealer_api python src/manage.py migrate

app:
	@mkdir -p src/apps/$(name)
	@docker exec -it -w /car_dealer car_dealer_api python src/manage.py startapp $(name) src/apps/$(name)

build_compose:
	@docker-compose -f docker-compose-dev.yml build

start_compose:
	@docker-compose -f docker-compose-dev.yml up

stop_compose:
	@docker-compose -f docker-compose-dev.yml down --remove-orphans

test_env:
	@cat ./docker/envs/env_example > ./docker/envs/.env-local

test_user:
	@docker exec -it -w /car_dealer car_dealer_api python src/manage.py createsuperuser