container_name := atcoder-cpp
image_tag := latest
uid := $(shell id -u)
gid := $(shell id -g)

.PHONY: build run

build:
	docker build -t ${container_name}:${image_tag} . \
			            --build-arg USER_UID=${uid} \
									--build-arg USER_GID=${gid}

run:
	docker run --rm -it \
		         -v $(shell pwd)/work:/home/builder/work \
						 ${container_name}:${image_tag}
	
