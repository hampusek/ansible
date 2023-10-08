TAGS=install

install:
	ansible-playbook $(TAGS) local.yml

build:
	docker build --tag ansible .

run:
	docker run -it --rm  ansible /bin/bash -c "ansible-playbook -t core -t neovim -t dotfiles local.yml && nvim"
