
.phony: download build install shell

SOURCEDIR := /tmp/
TARGETDIR := /opt/
I3VERSION := 4.13

all: build

download:
	bash ./download.sh "$(SOURCEDIR)" "$(I3VERSION)"

build: download Dockerfile src/build.sh
	docker build -t yuce/i3wm-builder .

install: build
	docker run --rm -v $(SOURCEDIR):/tmp/ -v $(TARGETDIR):/opt/ -e "I3VERSION=$(I3VERSION)" yuce/i3wm-builder

shell:
	docker run --rm -it -v $(SOURCEDIR):/tmp/ -v $(TARGETDIR):/opt/ -e "I3VERSION=$(I3VERSION)" --entrypoint /bin/bash yuce/i3wm-builder