TAGS=install

install:
	ansible-playbook $(TAGS) local.yml

build:
	docker build --tag ansible .

run:
	#docker run -it --rm  ansible /bin/bash -c "ansible-playbook -t core -t neovim -t dotfiles -t go local.yml && nvim"
	docker run \
		--volume $(PWD)/local.yml:/home/hampusek/local.yml \
		--volume $(PWD)/tasks:/home/hampusek/tasks \
		-it \
		--rm  \
		ansible \
		/bin/bash -c "ansible-playbook -t ghostty local.yml && bash" \
		#/bin/bash -c "ansible-playbook -t core -t neovim -t dotfiles -t go local.yml && nvim"
