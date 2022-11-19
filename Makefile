.PHONY: dev, release, run, test, clean

DOCKER_EXISTS := $(shell docker --help > /dev/null 2>&1; echo $$?)

PORT ?= 3000

dev: SHELL:=/bin/bash
dev: # Run the development environment
	@./bin/start -m dev

release: SHELL:=/bin/bash
release: # Check docker and env vars are present then build container
ifndef LFM_TOKEN
	$(error No token provided. Please set LFM_TOKEN environment variable)
endif
ifdef DOCKER_EXISTS
	@docker build --build-arg PORT=$(PORT) --build-arg LFM_TOKEN=$(LFM_TOKEN) --network=host -t toru:latest .
else
	@echo "Docker is not available. Please install docker and try again."
endif

run: SHELL:=/bin/bash
run: # Check docker is present then run container
ifdef DOCKER_EXISTS
	@docker stop toru-latest > /dev/null || true && docker rm toru-latest > /dev/null || true
	@docker run -p $(PORT):$(PORT) -it -d --name toru-latest toru:latest
else
	@echo "Docker is not available. Please install docker and try again."
endif

test: SHELL:=/bin/bash
test: # Run the mix test suite
	mix deps.get > /dev/null
	mix deps.compile --force
	LFM_TOKEN=$(LFM_TOKEN) mix test

clean: SHELL:=/bin/bash
clean: # Remove unused dirs
	@rm -rf ./_build ./deps ./erl_crash.dump
