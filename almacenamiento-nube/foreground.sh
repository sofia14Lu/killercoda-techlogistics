#!/bin/bash

# Actualizar e instalar herramientas necesarias
apt-get update && apt-get install -y awscli curl zip

# Crear directorios de trabajo
mkdir -p /home/usuario/datos-locales
mkdir -p /home/usuario/minio-data

# Mensaje de bienvenida
echo "Entorno preparado para TechLogistics S.A."
