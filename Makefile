IMAGENAME = gasbuddy/pg-plv8-postgis

all: build

build:
	docker build -t $(IMAGENAME) .

clean:
	docker images | awk -F' ' '{if ($$1=="$(IMAGENAME)") print $$3}' | xargs -r docker rmi

test:
	docker run --rm -t -i -p 5432:5432 $(IMAGENAME)

publish:
	docker push $(IMAGENAME)