#!/usr/bin/env bash

kubectl delete -f deploy/crds/metrics.jary.io_v1_metricsservice_cr.yaml
kubectl delete -f deploy/operator.yaml
kubectl delete -f deploy/role.yaml
kubectl delete -f deploy/role_binding.yaml
kubectl delete -f deploy/service_account.yaml
kubectl delete -f deploy/crds/metrics.jary.io_metricsservices_crd.yaml