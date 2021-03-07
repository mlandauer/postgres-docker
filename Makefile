SHELL=/bin/bash -o pipefail

REGISTRY ?= mlandauer
BIN      := postgres
IMAGE    := $(REGISTRY)/$(BIN)
TAG      := $(shell git describe --exact-match --abbrev=0 2>/dev/null || echo "")

.PHONY: push
push:
	docker buildx build --push --platform linux/arm64 -t $(IMAGE):$(TAG) .

.PHONY: version
version:
	@echo ::set-output name=version::$(TAG)
