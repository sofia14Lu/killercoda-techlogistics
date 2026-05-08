# Paso 3: Automatización de Backups

En este paso automatizaremos la migración de archivos hacia el bucket S3 utilizando un script Bash.

## Crear archivos de prueba

```bash
mkdir -p /data/backups

touch /data/backups/backup1.sql
touch /data/backups/backup2.sql
touch /data/backups/manual.pdf
```

## Crear el script de automatización

```bash
nano backup_auto.sh
```

Pegar el siguiente contenido:

```bash
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
```

## Dar permisos y ejecutar

```bash
chmod +x backup_auto.sh
./backup_auto.sh
```

## Verificar archivos subidos

```bash
aws --endpoint-url http://localhost:9000 s3 ls s3://techlogistics-assets
```
