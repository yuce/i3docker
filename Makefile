
.phony: build install

all: build

build: Dockerfile src/build.sh
	docker build -t yuce/i3wm-builder .

install: build
	docker run --rm -v /tmp/:/tmp/ -v /opt/:/opt/ yuce/i3wm-builder