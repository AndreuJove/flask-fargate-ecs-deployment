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
	docker build . -t $(TEST_IMAGE) -f docker/Dockerfile.test
	docker run -p $(PORT):$(PORT) $(TEST_IMAGE)

.PHONY: clean
clean:
	docker rmi $(APP_IMAGE) $(TEST_IMAGE) || true