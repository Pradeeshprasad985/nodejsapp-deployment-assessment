# 🚀 Node.js DevOps Assessment Project

## 📌 Overview

This project demonstrates a **production-ready DevOps setup** for a Node.js application, including:

* Infrastructure as Code (Terraform)
* Containerization using Docker
* CI/CD pipeline using GitHub Actions
* Deployment on AWS ECS (Fargate)
* Load balancing with Application Load Balancer (ALB)
* Automation scripts for operations

---

## 🧱 Architecture

```
User → ALB → ECS (Fargate) → Node.js App
             ↓
         CloudWatch Logs

CI/CD → GitHub Actions → ECR → ECS
Terraform → AWS Infrastructure
```

---

## ⚙️ Tech Stack

* **Backend**: Node.js (Express)
* **Infrastructure**: Terraform
* **Cloud**: AWS (ECS, ECR, ALB, VPC, IAM)
* **CI/CD**: GitHub Actions
* **Containerization**: Docker

---

## 📁 Project Structure

```
nodejs-devops-assessment/
│
├── app
│   ├── Dockerfile
│   ├── package.json
│   └── src
│       └── index.js
├── docs
│   └── architecture.png
├── infra
│   ├── backend.tf
│   ├── environments
│   │   ├── dev.tfvars
│   │   └── prod.tfvars
│   ├── main.tf
│   ├── outputs.tf
│   ├── provicer.tf
│   └── variables.tf
├── README.md
└── script
    ├── deploy.sh
    ├── health-check.sh
    ├── log-rotate.sh
    ├── migrate.sh
    └── rollback.sh

```

---

## 🚀 Application Setup (Local)

```bash
cd app
npm install
npm start
```

App will run on:

```
http://localhost:3000
```

Health check:

```
http://localhost:3000/health
```

---

## 🐳 Docker Setup

Build image:

```bash
docker build -t devops-app ./app
```

Run container:

```bash
docker run -p 3000:3000 devops-app
```

---

## ☁️ Infrastructure Setup (Terraform)

### Initialize

```bash
cd infra
terraform init
```

### Plan

```bash
terraform plan -var-file=environments/dev.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/dev.tfvars
```

---

## 🔁 CI/CD Pipeline

The pipeline is triggered on every push to the `main` branch.

### Steps:

1. Install dependencies
2. Run tests
3. Build Docker image
4. Push image to AWS ECR
5. Deploy to ECS using `force-new-deployment`

---

## 🔐 GitHub Secrets Required

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_ACCOUNT_ID`

---

## ⚙️ Automation Scripts

### 🚀 deploy.sh

Triggers ECS deployment

```bash
bash scripts/deploy.sh
```

---

### 🔁 rollback.sh

Basic rollback mechanism

```bash
bash scripts/rollback.sh
```

---

### ❤️ health-check.sh

Checks application health

```bash
bash scripts/health-check.sh http://<ALB-URL>/health
```

---

### 🧹 log-rotate.sh

Rotates application logs

---

### 🗃️ migrate.sh

Handles database migrations (placeholder)

---

## 🌍 Deployment

After deployment, access the application via:

```
http://<load-balancer-dns>
```

---

## 🔒 Security Best Practices

* IAM roles with least privilege
* Secrets managed via GitHub Secrets
* No hardcoded credentials
* Secure Docker image usage

---

## 📈 Future Improvements

* Add HTTPS using ACM
* Implement auto-scaling for ECS
* Add monitoring & alerting (CloudWatch, Prometheus)
* Add proper rollback with versioned images
* Integrate linting and security scanning tools

---

## 👤 Author

* Name: Your Name
* Email: [your-email@example.com](mailto:your-email@example.com)

---

## ✅ Conclusion

This project demonstrates a **complete DevOps lifecycle**:

* Infrastructure provisioning
* Application containerization
* Automated CI/CD pipeline
* Scalable cloud deployment
* Operational scripting

---
