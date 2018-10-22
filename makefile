
build-dev:
	docker build -t rockstat/anaconda:dev .

run:
	docker run --rm -p 8083:8080 rockstat/anaconda:dev 

