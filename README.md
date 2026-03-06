# Cloud-Native App Delivery – Inventory Application

## 📌 Project Overview

This project demonstrates a **complete Cloud-Native application delivery pipeline**, from containerization to automated deployment on a Kubernetes cluster.

The objective is to implement a **modern DevOps workflow** that ensures reliability, automation, and scalability for deploying an Inventory Management Application.

The project includes:

* Application containerization using **Docker**
* Automated image build and push using **GitHub Actions**
* Deployment orchestration using **Kubernetes**
* Exposure of the application through a **Kubernetes Service**

---

# 🏗 Architecture

Developer → GitHub Repository → GitHub Actions (CI) → DockerHub → Kubernetes Cluster → Web Application

Technologies used:

* **Docker**
* **GitHub Actions**
* **Docker Hub**
* **Kubernetes**
* **Minikube**
* **Node.js**

---

# 📂 Repository Structure

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

# 🐳 1. Run Application Locally with Docker

### Build the Docker image

```bash
docker build -t inventory-app .
```

### Run the container

```bash
docker run -p 3000:3000 inventory-app
```

### Access the application

Open your browser:

```
http://localhost:3000
```

---

# ⚙️ 2. CI/CD Pipeline (GitHub Actions)

A **GitHub Actions workflow** automatically builds and pushes the Docker image whenever code is pushed to the main branch.

Pipeline steps:

1. Checkout repository
2. Login to DockerHub
3. Build Docker image
4. Tag image using commit SHA
5. Push image to DockerHub

Example pipeline configuration:

```
.github/workflows/docker.yml
```

The image is pushed to DockerHub with the following tags:

```
sudo3k/actions:<commit_sha>
sudo3k/actions:latest
```

---

# ☸️ 3. Kubernetes Deployment

The application is deployed on a Kubernetes cluster using **Deployment** and **Service** manifests.

### Deployment

* 3 replicas for high availability
* Uses the DockerHub image built by the CI pipeline

```
k8s/deployment.yaml
```

### Service

A **NodePort service** exposes the application outside the cluster.

```
k8s/service.yaml
```

---

# 🚀 Deploy to Kubernetes

Apply the manifests:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

Verify resources:

```bash
kubectl get all
```

Example output:

```
pod/inventory-app-xxxxx   Running
pod/inventory-app-xxxxx   Running
pod/inventory-app-xxxxx   Running

deployment.apps/inventory-app   3/3

service/inventory-service   NodePort
```

---

# 🌐 Access the Application

If using Minikube:

```bash
minikube service inventory-service
```

or

```
http://<minikube-ip>:30007
```

---

# 📸 Required Screenshots

The following screenshots demonstrate the correct functioning of the project.

### CI/CD Pipeline

GitHub Actions successful pipeline execution.

<img src="screenshots/github-actions.png" width="700"/>

---

### DockerHub Image

Docker image pushed with the correct tag.

<img src="screenshots/dockerhub.png" width="700"/>

---

### Kubernetes Cluster

Output of the following command:

```
kubectl get all
```

<img src="screenshots/kubernetes.png" width="700"/>

---

### Application Running

Web browser displaying the application.

<img src="screenshots/application.png" width="700"/>

---

# 📊 Key DevOps Concepts Demonstrated

This project demonstrates several important DevOps practices:

* **Containerization**
* **Continuous Integration**
* **Infrastructure as Code**
* **Kubernetes orchestration**
* **Automated image distribution**
* **Scalable application deployment**

---

# 🔮 Possible Improvements

Future improvements could include:

* Kubernetes **Ingress Controller**
* Automatic **CD deployment**
* **Helm charts**
* **Monitoring with Prometheus & Grafana**
* **Container security scanning**

---

# 👨‍💻 ASSETS (SCREENSHOTS)

Check out the [screenshots](screenshots) folder for more details.