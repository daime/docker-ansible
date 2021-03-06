user ?= root
host ?= localhost

prepare:
	mkdir -p tmp
	cp ~/.ssh/id_rsa.pub tmp

clean:
	rm -rf tmp

build: prepare
	docker build -t ansible-base-image .
	make clean

run:
	docker run -p 2200:22 -it ansible-base-image

ssh:
	ssh -o StrictHostKeyChecking=no $(user)@$(host) -p 2200
