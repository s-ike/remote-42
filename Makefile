ifneq (,$(wildcard ./.env))
	include .env
	export
	ENV_FILE_PARAM = --env-file .env
endif

image:
	docker build -t remote-42 .

rmi:
	docker rmi -f `docker images "remote-42" -q`

run:
	docker run -it --rm -e DISPLAY="$(IP_ADDRESS):0.0" $(ENV_FILE_PARAM) -v $(YOUR_LOCAL_PROJECT_PATH):/work --name remote-42 remote-42

test:
	echo $(USER)

rm:
	docker rm remote-42

.PHONY:	image rmi run rm test
