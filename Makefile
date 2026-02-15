IMAGE_NAME ?= flask-hello
TAG        ?= 1.0.0
PORT       ?= 5000

APP_IMAGE   = $(IMAGE_NAME):$(TAG)
TEST_IMAGE  = $(IMAGE_NAME)-tests:$(TAG)

.PHONY: up
up:
	docker build . -t $(APP_IMAGE) -f docker/Dockerfile
	docker run -p $(PORT):$(PORT) $(APP_IMAGE)

.PHONY: tests
tests:
	@echo "Building test image..."
	docker build . -t $(TEST_IMAGE) -f docker/Dockerfile.test
	@echo "Running tests..."
	# --rm ensures the container is deleted after the test finishes
	docker run --rm --name $(IMAGE_NAME)-test-run $(TEST_IMAGE)

.PHONY: clean
clean:
	@echo "Cleaning up images..."
	docker rmi $(APP_IMAGE) $(TEST_IMAGE) 2>/dev/null || true
	# Stop any running containers from this project
	docker ps -aq --filter "name=$(IMAGE_NAME)" | xargs -r docker stop | xargs -r docker rm
