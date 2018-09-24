
build-dev:
	docker build -t rockstat/anaconda:dev .

run:
	docker run --rm rockstat/anaconda:dev
