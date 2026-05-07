# 🚀 Portfolio App - DevOps Cloud Project

## 📚 Module Information
CSI_7_COD_2526 – Container Orchestration for DevOps  
MSc Computer Science

---

## 👨‍💻 Project Overview

This project demonstrates the development and deployment of a cloud-native portfolio web application using modern DevOps tools and practices.

The application is containerized using Docker, deployed using Kubernetes (Minikube), and managed through GitHub for version control. It follows CI/CD principles using Jenkins and is hosted on AWS EC2.

---

## 🛠️ Technologies Used

- ☁️ AWS EC2 (Cloud Infrastructure)
- 🐳 Docker (Containerization)
- ☸️ Kubernetes (Minikube Orchestration)
- 🔄 Jenkins (CI/CD Pipeline)
- 🐙 Git & GitHub (Version Control)
- 🌐 HTML, CSS (Frontend Development)

---

## 📁 Project Structure

```
Ghazanfar6.github.io/
├── index.html
├── style.css
├── assets/
├── Dockerfile
├── Jenkinsfile
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
└── README.md
```

---

## 🐳 Docker Instructions

### Build Docker Image
```bash
docker build -t portfolio-app .
```

### Run Container
```bash
docker run -d -p 8081:8081 portfolio-app
```

### Push to Docker Hub
```bash
docker push ghazanfar6/portfolio-app:latest
```

---

## ☸️ Kubernetes Deployment

### Start Minikube
```bash
minikube start
```

### Deploy Application
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### Check Pods
```bash
kubectl get pods
```

### Check Services
```bash
kubectl get services
```

---

## 🌍 Access Application

### Option 1: NodePort (Recommended)
```
http://75.101.208.73:8080/
```

### Option 2: Port Forward
```bash
kubectl port-forward service/portfolio-service 8080:80
```

Then open:
```
http://localhost:8080
```

---

## 🔄 CI/CD Pipeline (Jenkins)

The pipeline automates the following stages:

1. Checkout code from GitHub
2. Build Docker image
3. Test container
4. Push image to Docker Hub
5. Deploy to Kubernetes cluster

---

## 📌 Key Features

- ✔ Fully containerized web application
- ✔ Kubernetes deployment with multiple replicas
- ✔ NodePort service for external access
- ✔ CI/CD pipeline using Jenkins
- ✔ Cloud deployment on AWS EC2
- ✔ Scalable and production-style architecture

---

## 🔗 Links

- **GitHub Repository:** https://github.com/Ghazanfar6/Ghazanfar6.github.io
- **Docker Hub:** https://hub.docker.com/r/ghazanfar6/portfolio-app

---

## 📧 Author

- **Name:** Ghazanfar  
- **GitHub:** [@Ghazanfar6](https://github.com/Ghazanfar6)
- **Course:** MSc Computer Science

---

## ✅ Status

- ✔ Dockerized Application
- ✔ Kubernetes Deployment
- ✔ CI/CD Pipeline Designed
- ✔ Cloud Hosted on AWS EC2
- ✔ Fully Functional Portfolio System
