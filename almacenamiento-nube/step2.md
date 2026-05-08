# Paso 2: Configurar AWS CLI

Ahora configuraremos las credenciales para conectar la terminal con MinIO.

## Configurar credenciales

```bash
aws configure set aws_access_key_id minioadmin
aws configure set aws_secret_access_key minioadmin
aws configure set region us-east-1
```

## Crear el bucket

```bash
aws --endpoint-url http://localhost:9000 s3 mb s3://techlogistics-assets
```

## Verificar buckets creados

```bash
aws --endpoint-url http://localhost:9000 s3 ls
```
