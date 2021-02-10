IMAGENAME = gasbuddy/pg-plv8-postgis
VERSION = 12-2

all: build

build:
	docker build -t $(IMAGENAME):$(VERSION) .

clean:
	docker images | awk -F' ' '{if ($$1=="$(IMAGENAME):$(VERSION)") print $$3}' | xargs docker rmi

test:
	docker run --rm -t -i -p 5432:5432 $(IMAGENAME):$(VERSION)

publish:
	docker push $(IMAGENAME):$(VERSION)