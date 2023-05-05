SHELL := /bin/bash

TEST_PKGS := $(shell go list ./... | grep -v 'mock_*' | grep -v 'tester' | grep -v 'proto' | grep -v 'cmd'| grep -v 'api')

## make test: Run go unittest
unittest:
	@go test -short -coverprofile cover.out -covermode=atomic ${TEST_PKGS}
	@cat cover.out | grep -v "pb.go" >> coverage.txt"


publish-binary:
	@echo "publish binary"