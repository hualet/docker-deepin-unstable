build: build_baseimage build_builderimage

build_baseimage:
	debootstrap --no-check-gpg unstable rootfs https://packages.deepin.com/deepin/
	tar -C rootfs -c . | docker import - baseimage

build_builderimage:
	docker build -t builderimage docker

push: push_baseimage push_builderimage

push_baseimage:
	docker tag baseimage hualet/deepin:unstable
	docker push hualet/deepin:unstable

push_builderimage:
	docker tag builderimage hualet/deepin:unstable-builder
	docker push hualet/deepin:unstable-builder

clean:
	rm -fr rootfs || true
	docker rmi baseimage -f || true
	docker rmi builderimage -f || true
	docker rmi deepin/unstable:latest || true
	docker rmi deepin/unstable-builder:latest || true