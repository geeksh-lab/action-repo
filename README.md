# Cloud-Native App Delivery – Inventory Application

---

# 🇬🇧 English Version

## 📌 Project Overview

This project demonstrates a **complete Cloud-Native application delivery pipeline**, from containerization to automated deployment on a Kubernetes cluster.

The objective is to implement a **modern DevOps workflow** that ensures reliability, automation, and scalability for deploying an Inventory Management Application.

The project includes:

* Application containerization using **Docker**
* Automated image build and push using **GitHub Actions**
* Deployment orchestration using **Kubernetes**
* Exposure of the application through a **Kubernetes Service**

---

## 🏗 Architecture

Developer → GitHub Repository → GitHub Actions (CI) → DockerHub → Kubernetes Cluster → Web Application

Technologies used:

* Docker
* GitHub Actions
* Docker Hub
* Kubernetes
* Minikube
* Node.js

---

## 📂 Repository Structure

```
Cloud-Native-App-Delivery
│
├── app/                     # Application source code
│
├── .github/workflows/      # CI/CD pipeline configuration
│   └── docker.yml
│
├── k8s/                     # Kubernetes manifests
│   ├── deployment.yaml
│   └── service.yaml
│
├── Dockerfile               # Container build configuration
│
└── README.md                # Project documentation
```

---

## 🐳 Run Application Locally with Docker

### Build the Docker image

```bash
docker build -t inventory-app .
```

### Run the container

```bash
docker run -p 3000:3000 inventory-app
```

### Access the application

```
http://localhost:3000
```

---

## ⚙️ CI/CD Pipeline (GitHub Actions)

A **GitHub Actions workflow** automatically builds and pushes the Docker image whenever code is pushed to the `main` branch.

Pipeline steps:

1. Checkout repository
2. Login to DockerHub
3. Build Docker image
4. Tag image using commit SHA
5. Push image to DockerHub

The image is pushed with the following tags:

```
sudo3k/actions:<commit_sha>
sudo3k/actions:latest
```

---

## ☸️ Kubernetes Deployment

The application is deployed using Kubernetes manifests.

### Deployment

* 3 replicas for high availability
* Uses the DockerHub image built by the CI pipeline

```
k8s/deployment.yaml
```

### Service

A **NodePort Service** exposes the application externally.

```
k8s/service.yaml
```

---

## 🚀 Deploy to Kubernetes

Apply the manifests:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

Verify cluster resources:

```bash
kubectl get all
```

---

## 🌐 Access the Application

If using Minikube:

```bash
minikube service inventory-service
```

or

```
http://<minikube-ip>:30007
```

---

## 📸 Screenshots

### CI/CD Pipeline

<img src="screenshots/github-actions.png" width="700"/>

### DockerHub Image

<img src="screenshots/dockerhub.png" width="700"/>

### Kubernetes Cluster

<img src="screenshots/kubernetes.png" width="700"/>

### Application Running

<img src="screenshots/application.png" width="700"/>

---

## 📊 DevOps Concepts Demonstrated

This project demonstrates key DevOps practices:

* Containerization
* Continuous Integration
* Infrastructure as Code
* Kubernetes orchestration
* Automated image distribution
* Scalable application deployment

---

## 🔮 Possible Improvements

Future enhancements could include:

* Kubernetes **Ingress Controller**
* Automated **Continuous Deployment**
* **Helm charts**
* **Monitoring (Prometheus + Grafana)**
* **Security scanning for containers**

---

# 🇫🇷 Version Française

## 📌 Présentation du Projet

Ce projet démontre la mise en place d’une **chaîne complète de livraison d’application Cloud-Native**, allant de la conteneurisation jusqu’au déploiement automatisé sur un cluster Kubernetes.

L’objectif est de mettre en œuvre un **workflow DevOps moderne** garantissant fiabilité, automatisation et scalabilité pour le déploiement d’une application de gestion de stock.

Le projet inclut :

* La conteneurisation de l’application avec **Docker**
* La construction et le push automatique de l’image avec **GitHub Actions**
* L’orchestration du déploiement avec **Kubernetes**
* L’exposition de l’application via un **Service Kubernetes**

---

## 🏗 Architecture

Développeur → Dépôt GitHub → GitHub Actions (CI) → DockerHub → Cluster Kubernetes → Application Web

Technologies utilisées :

* Docker
* GitHub Actions
* Docker Hub
* Kubernetes
* Minikube
* Node.js

---

## 🐳 Lancer l’application localement avec Docker

### Construire l’image

```bash
docker build -t inventory-app .
```

### Lancer le conteneur

```bash
docker run -p 3000:3000 inventory-app
```

### Accéder à l’application

```
http://localhost:3000
```

---

## ⚙️ Pipeline CI/CD

Un pipeline **GitHub Actions** est déclenché automatiquement à chaque `git push` sur la branche `main`.

Étapes du pipeline :

1. Récupération du code (checkout)
2. Connexion à DockerHub
3. Construction de l’image Docker
4. Tag de l’image avec le SHA du commit
5. Push de l’image sur DockerHub

---

## ☸️ Déploiement Kubernetes

L’application est déployée sur Kubernetes à l’aide de manifestes YAML.

### Deployment

* 3 réplicas pour la haute disponibilité
* Utilisation de l’image DockerHub générée par le pipeline CI

### Service

Un **Service NodePort** permet d’exposer l’application en dehors du cluster.

---

## 🚀 Déploiement sur Kubernetes

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

Vérification :

```bash
kubectl get all
```

---

## 🌐 Accès à l’application

Avec Minikube :

```bash
minikube service inventory-service
```

ou

```
http://<minikube-ip>:30007
```

---

## 📸 Captures d’écran

Les captures d’écran du projet sont disponibles dans le dossier :

```
/screenshots
```

Elles montrent :

* Le pipeline CI/CD GitHub Actions
* L’image Docker sur DockerHub
* Le cluster Kubernetes en fonctionnement
* L’application accessible depuis un navigateur
