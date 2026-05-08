#!/bin/bash

apt-get update && apt-get install -y awscli curl

mkdir -p /home/usuario/datos-locales
mkdir -p /home/usuario/minio-data

echo "Entorno preparado para TechLogistics S.A."
