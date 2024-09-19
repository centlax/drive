git:
	@echo "Git add & commit"
	bash .config/scripts/git.sh

build:
	@echo "Start run build dev image"
	docker compose -f .docker/compose.sand.yaml build
	
up:
	@echo "Start run dev container"
	docker compose -f .docker/compose.sand.yaml up -d

watch:
	@echo "Watch image"
	docker compose -f .docker/compose.sand.yaml watch

stop:
	@echo "Stop Container dev"
	docker compose -f .docker/compose.sand.yaml stop

down:
	@echo "Destroy Container dev"
	docker compose -f .docker/compose.sand.yaml down  --remove-orphans