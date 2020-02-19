#!/bin/sh

USERNAME=jary
APPNAME=metrics-service

operator-sdk build quay.io/${USERNAME}/${APPNAME}
docker login quay.io
docker push quay.io/${USERNAME}/${APPNAME}

sed -i "s|REPLACE_IMAGE|quay.io/${USERNAME}/${APPNAME}|g" deploy/operator.yaml