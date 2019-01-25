

.PHONY: build build-r tag-dev tag-latest push-latest run
build:
	docker build -t anaconda .
	docker build -t anaconda-lab -f Dockerfile_lab .

build-r:
	docker build -t anaconda-r -f Dockerfile_r .

tag-dev:
	docker tag anaconda rockstat/anaconda:dev

tag-latest:
	docker tag anaconda rockstat/anaconda:latest
	docker tag anaconda-lab rockstat/anaconda:lab
	docker tag anaconda-r rockstat/anaconda:r

push-latest:
	docker push rockstat/anaconda:latest
	docker push rockstat/anaconda:lab
	# docker push rockstat/anaconda:r

run:
	docker run --rm -p 8083:8080 rockstat/anaconda:dev 

