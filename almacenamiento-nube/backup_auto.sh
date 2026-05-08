#!/bin/bash

ENDPOINT="http://localhost:9000"
BUCKET="s3://techlogistics-assets"
BACKUP_DIR="/data/backups"
ZIP_NAME="backup_$(date +%Y%m%d_%H%M%S).zip"

echo "Iniciando proceso de backup..."

if [ ! -d "$BACKUP_DIR" ]; then
    echo "La carpeta $BACKUP_DIR no existe."
    exit 1
fi

zip -r /tmp/$ZIP_NAME $BACKUP_DIR

if [ $? -ne 0 ]; then
    echo "Error al comprimir archivos."
    exit 1
fi

aws --endpoint-url $ENDPOINT s3 cp /tmp/$ZIP_NAME $BUCKET

if [ $? -eq 0 ]; then
    echo "Backup subido correctamente."
    rm -rf $BACKUP_DIR/*
    rm /tmp/$ZIP_NAME
else
    echo "Error al subir backup."
fi
