FROM ghost:5.27.0-alpine
WORKDIR /var/lib/ghost
RUN npm install --prefix /tmp/ghost-storage-adapter-s3 ghost-storage-adapter-s3 && \
  cp -r /tmp/ghost-storage-adapter-s3/node_modules/ghost-storage-adapter-s3 current/core/server/adapters/storage/s3 && \
  rm -r /tmp/ghost-storage-adapter-s3

RUN npm install ghost-storage-base && npm install aws-sdk