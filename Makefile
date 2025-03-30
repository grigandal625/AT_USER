include ./docker/at_user_local/.env
components:
	docker compose -f ./docker/at_user_local/docker-compose.yml down --remove-orphans
	docker compose -f ./docker/at_user_local/docker-compose.yml up --build -d
stop:
	docker compose -f ./docker/at_user_local/docker-compose.yml down --remove-orphans