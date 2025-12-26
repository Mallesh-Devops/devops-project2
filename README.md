# DevOps Kubernetes End-to-End Project

## Tech Stack
- Docker
- Kubernetes (kind)
- NGINX Ingress
- ConfigMap & Secrets
- Horizontal Pod Autoscaler
- Shell-based CI/CD
- Monitoring Ready (Dynatrace / Prometheus)

## Architecture
Developer → Docker → kind Kubernetes → Ingress → Service → Pod

## How to Run
```bash
kind create cluster --name devops-cluster
cd scripts
./deploy.sh
