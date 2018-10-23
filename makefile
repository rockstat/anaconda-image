
build:
	docker build -t anaconda .

tag-dev:
	docker tag anaconda rockstat/anaconda:dev

tag-latest:
	docker tag anaconda rockstat/anaconda:latest

push-latest:
	docker push rockstat/anaconda:latest

run:
	docker run --rm -p 8083:8080 rockstat/anaconda:dev 

