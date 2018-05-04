#!/usr/bin/env bash
set -x -e

docker build --no-cache -t "$1"/php:7.2.1-apache -t "$1"/php:latest 7.2.1-apache
docker tag "$1"/php:latest "$1"/php:latest

docker login -u "$2" -p "$3" jaykay.azurecr.io

docker push "$1"/php:latest
docker push "$1"/php:7.2.1-apache

docker logout
