# Paso 1: Lanzar el Servidor de Objetos (MinIO)

Para simular AWS S3, usaremos **MinIO**. Es ideal para laboratorios porque usa el mismo protocolo que la nube real.

## Descargar e iniciar MinIO

```bash
wget https://dl.min.io/server/minio/release/linux-amd64/minio

chmod +x minio

./minio server /home/usuario/minio-data --address :9000 &
```

El servidor ahora corre en el puerto 9000, simulando un endpoint de almacenamiento cloud.
