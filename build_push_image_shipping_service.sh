#!/bin/bash

# Nama Docker image yang akan dibuat
IMAGE_NAME="shipping-service"

# Tag untuk image
IMAGE_TAG="latest"

# Nama pengguna Github
GITHUB_REPOSITORY="a433-microservices"

# Nama repositroy Github
GITHUB_USERNAME="rmuadzan"

# Nama image untuk Github Packages
GITHUB_PACKAGES_IMAGE="docker.pkg.github.com/$GITHUB_USERNAME/$GITHUB_REPOSITORY/$IMAGE_NAME:$IMAGE_TAG"

# Membuat Docker image dari Dockerfile
sudo docker build -t $IMAGE_NAME:$IMAGE_TAG .

# Menandai (tag) image dengan nama Github Packages
sudo docker tag $IMAGE_NAME:$IMAGE_TAG $GITHUB_PACKAGES_IMAGE

# Login ke Github Packages
echo $TOKEN_GITHUB_PACKAGES | sudo docker login docker.pkg.github.com -u $GITHUB_USERNAME --password-stdin

# Mengunggah image ke Github Packages
sudo docker push $GITHUB_PACKAGES_IMAGE

# Informasi hasil publish
echo "Docker image berhasil diunggah ke GitHub Packages: $GITHUB_PACKAGES_IMAGE"