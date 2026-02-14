up:
	docker build . -t flask-hello:1.0.0 -f docker/Dockerfile
	docker run -p 5000:5000 flask-hello:1.0.0

.PHONY: tests
tests:
	docker build . -t flask-hello-tests:1.0.0 -f docker/Dockerfile.test
	docker run -p 5000:5000 flask-hello-tests:1.0.0