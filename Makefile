TAGS=install

install:
	ansible-playbook $(TAGS) local.yml

build:
	docker build --build-arg TAGS=install --tag ansible .

run:
	docker run -it --rm  ansible /bin/bash -c "ansible-playbook -t core -t neovim local.yml && nvim"
