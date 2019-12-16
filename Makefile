REPO := ccr.ccs.tencentyun.com/ein-enterprise/devpi
DEVPI_SERVER_VERSION := 4.3.1

.PHONY: build
build:
	docker build -t $(REPO):$(DEVPI_SERVER_VERSION) --squash .
	docker push $(REPO):$(DEVPI_SERVER_VERSION)
