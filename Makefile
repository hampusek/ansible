TAGS=install

install:
	ansible-playbook $(TAGS) local.yml

build:
	docker build --build-arg TAGS=install --tag ansible .

run:
	docker run ansible