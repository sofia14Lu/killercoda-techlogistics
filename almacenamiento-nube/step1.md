# Paso 1: Lanzar MinIO

MinIO simulará AWS S3 localmente.

```bash
wget https://dl.min.io/server/minio/release/linux-amd64/minio
chmod +x minio
./minio server /home/usuario/minio-data --address :9000 &
