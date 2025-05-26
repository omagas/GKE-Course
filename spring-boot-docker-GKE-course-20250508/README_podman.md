# Spring Boot Hello GKE
這是一個簡單的Spring Boot應用程式，旨在展示如何將其部署到Google Kubernetes Engine (GKE)上。這個應用程式會返回一個簡單的"Hello GKE"訊息。(This is a simple Spring Boot application that demonstrates how to deploy it on Google Kubernetes Engine (GKE). The application returns a simple "Hello GKE" message.)

這個專案的目的是為了讓開發者能夠快速了解如何在GKE上運行Spring Boot應用程式，並且提供了一個簡單的範例來展示如何使用Docker和Kubernetes進行部署和管理。(This project aims to help developers quickly understand how to run Spring Boot applications on GKE, providing a simple example of how to use Docker and Kubernetes for deployment and management.)

# 1. 環境需求
- GCP Project
- GKE Cluster
- GCP IAM Role
  - Artifact Registry Reader
  - Kubernetes Engine Admin
  - Kubernetes Engine Cluster Viewer
  - Kubernetes Engine Developer
- java 11 or 17
- spring boot 2.7.x or 3.x.x
- Docker(podman)
- Maven



# 2. 這個專案包含以下步驟：

## 2.1 build local test
```
mvn clean install -DskipTests
```

## 2.2 build podman image
```
sudo su
```
```

podman build -t springboot-hello-gke-image:v1 -f ./Dockerfile .;
```


## 2.3 建立 GCP Artifact Registry(只需要建立一次) 
### 登入gcloud
```
gcloud auth login
```


### 2.4 建立AR image repositories
```
gcloud artifacts repositories create springboot-hello-gke --repository-format=docker \
  --location=asia-east1 \
  --description="Docker repository for Container Dev Workshop"
```
### 查看此repositories 狀態
```
gcloud artifacts repositories describe springboot-hello-gke --location=asia-east1
```


## 2.5 手動部署
### ReTag
```
podman tag springboot-hello-gke-image:v1 asia-east1-docker.pkg.dev/project-pic-rd/springboot-hello-gke/springboot-hello-gke-image:v1
```

podman tag springboot-hello-gke-image:v1 asia-east1-docker.pkg.dev/gkeproject-421913/springboot-hello-gke/springboot-hello-gke-image:v1

### Push
```
podman push asia-east1-docker.pkg.dev/project-pic-rd/springboot-hello-gke/springboot-hello-gke-image:v1
```

podman push asia-east1-docker.pkg.dev/gkeproject-421913/springboot-hello-gke/springboot-hello-gke-image:v1


### 登入GKE cluster
```
gcloud container clusters get-credentials $cluster-name --region asia-east1 --project project-pic-rd
```


### deploy
```
kubectl apply -f manifest/deployment.yaml
```


### expose
```
kubectl apply -f manifest/service.yaml
```


### check
```
kubectl get svc
```


### test
```
curl http://${external-ip}/
```


gcloud compute addresses create external-http2-static-g-ip \
  --region=asia-east1 \
  --network-tier=STANDARD


# Billing project

## 2.5 手動部署
### ReTag
```
podman tag springboot-hello-gke-image:v1 asia-east1-docker.pkg.dev/pic-gcp-billing-staging/springboot-hello-gke/springboot-hello-gke-image:v1
```


### Push
```
podman push asia-east1-docker.pkg.dev/pic-gcp-billing-staging/springboot-hello-gke/springboot-hello-gke-image:v1
```
