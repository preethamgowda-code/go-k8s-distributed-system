# High-Availability Distributed System on Kubernetes

![Go](https://img.shields.io/badge/Go-1.23-00ADD8?logo=go&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Production-326CE5?logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Multi--Stage-2496ED?logo=docker&logoColor=white)

## 🚀 Project Overview
This repository contains a **fault-tolerant, distributed web service** engineered in **Go (Golang)** and orchestrated via **Kubernetes**. 

Unlike standard web apps, this system is designed to demonstrate core **Distributed Systems principles**:
* **Self-Healing Infrastructure:** Automatic pod resurrection upon failure.
* **High Availability:** 3-replica load balancing ensuring zero downtime.
* **Optimized Runtime:** Multi-stage Docker build resulting in a sub-15MB production image.

## 🛠️ Tech Stack
* **Language:** Go (Golang 1.23) - Chosen for high-performance concurrency.
* **Containerization:** Docker (Alpine Linux base).
* **Orchestration:** Kubernetes (Kind/Minikube).
* **Networking:** Internal Cluster IP & LoadBalancer Service exposure.

## ⚡ Architecture
The system follows a microservices pattern:
1.  **Ingress:** Traffic enters via a LoadBalancer.
2.  **Distribution:** Requests are round-robin distributed across 3 replicas.
3.  **Resilience:** The K8s Control Plane monitors health; if a pod dies, it is instantly replaced.

## 📦 How to Run
```bash
# 1. Build the lightweight image
docker build -t google-prep-app:v1 .

# 2. Load into Cluster (Kind)
kind load docker-image google-prep-app:v1 --name google-prep

# 3. Deploy Infrastructure
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# 4. Verify Self-Healing
kubectl get pods
# Kill a pod manually to test resurrection
kubectl delete pod [POD_NAME]

PROOF OF COMPLITION:
<img width="1286" height="375" alt="image" src="https://github.com/user-attachments/assets/666ae2ce-536c-44db-94f1-1963bc3df504" />
