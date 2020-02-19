#!/bin/sh

if [[ -z ${CI} ]]; then
    ./scripts/go-mod.sh
    operator-sdk generate k8s
fi
go vet ./...