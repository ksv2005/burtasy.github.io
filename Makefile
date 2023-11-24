up:
	docker-compose up -d --build

down:
	docker-compose down

exec:
	docker exec -it v2-burtasy-app bash

logs:
	docker logs v2-burtasy-app --follow
