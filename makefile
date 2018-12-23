
build:
	docker build -t anaconda .
	docker build -t anaconda-lab -f Lab.Dockerfile .
	docker build -t anaconda-r -f R.Dockerfile .

tag-dev:
	docker tag anaconda rockstat/anaconda:dev

tag-latest:
	docker tag anaconda rockstat/anaconda:latest
	docker tag anaconda-lab rockstat/anaconda:lab
	docker tag anaconda-r rockstat/anaconda:r

push-latest:
	docker push rockstat/anaconda:latest
	docker push rockstat/anaconda:lab
	docker push rockstat/anaconda:r

run:
	docker run --rm -p 8083:8080 rockstat/anaconda:dev 

