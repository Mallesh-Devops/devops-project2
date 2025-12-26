#!/bin/bash

set -e

APP_NAME=devops-k8s-app
IMAGE_TAG=v1
CLUSTER_NAME=devops-cluster

echo "🚀 Building Docker image..."
docker build -t $APP_NAME:$IMAGE_TAG ../app

echo "📦 Loading image into kind cluster..."
kind load docker-image $APP_NAME:$IMAGE_TAG --name $CLUSTER_NAME

echo "📄 Applying Kubernetes manifests..."
kubectl apply -f ../k8s/configmap.yaml
kubectl apply -f ../k8s/secret.yaml
kubectl apply -f ../k8s/deployment.yaml
kubectl apply -f ../k8s/service.yaml
kubectl apply -f ../k8s/ingress.yaml
kubectl apply -f ../k8s/hpa.yaml

echo "✅ Deployment completed successfully"
