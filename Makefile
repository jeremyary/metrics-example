# kernel-style V=1 build verbosity
ifeq ("$(origin V)", "command line")
       BUILD_VERBOSE = $(V)
endif

ifeq ($(BUILD_VERBOSE),1)
       Q =
else
       Q = @
endif

.PHONY: all
all: build

.PHONY: build
build:
	./scripts/go-build.sh

.PHONY: clean
clean:
	rm -rf build/_output

.PHONY: format
	./scripts/go-fmt.sh

.PHONY: sdk-generate
sdk-generate: mod
	operator-sdk generate k8s

.PHONY: vet
vet:
	./scripts/go-vet.sh

.PHONY: test
test:
	./scripts/go-test.sh

.PHONY: cluster-setup
cluster-setup:
	./scripts/cluster-setup.sh

.PHONY: cluster-clean
cluster-clean:
	./scripts/cluster-clean.sh


