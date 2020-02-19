#!/usr/bin/env bash

kubectl create -f deploy/service_account.yaml
kubectl create -f deploy/role.yaml
kubectl create -f deploy/role_binding.yaml
kubectl create -f deploy/crds/metrics.jary.io_metricsservices_crd.yaml
kubectl create -f deploy/operator.yaml
kubectl create -f deploy/crds/metrics.jary.io_v1_metricsservice_cr.yaml