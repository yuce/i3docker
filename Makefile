
.phony: build

all: build

build: Dockerfile build.sh
	docker build -t yuce/i3wm-builder .

install:
	docker run --rm -v /tmp/:/tmp/ -v /opt/:/opt/ yuce/i3wm-builder