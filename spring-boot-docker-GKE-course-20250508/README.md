# Spring Boot Hello GKE
# 這是一個簡單的Spring Boot應用程式，旨在展示如何將其部署到Google Kubernetes Engine (GKE)上。這個應用程式會返回一個簡單的"Hello GKE"訊息。
# 這個專案的目的是為了讓開發者能夠快速了解如何在GKE上運行Spring Boot應用程式，並且提供了一個簡單的範例來展示如何使用Docker和Kubernetes進行部署和管理。
# 1. 環境需求
#   - GCP Project
#   - GKE Cluster
#   - Docker
#   - Maven


# build local test
```
mvn clean install -DskipTests
```

# build docker image
```
sudo su
```
```
docker build -t springboot-hello-gke-image:v1 -f ./Dockerfile .;
```


# 建立 GCP Artifact Registry(只需要建立一次) 
### 登入gcloud
```
gcloud auth login
```


### 建立AR image repositories
```
gcloud artifacts repositories create springboot-hello-gke --repository-format=docker \
  --location=asia-east1 \
  --description="Docker repository for Container Dev Workshop"
```



# 手動部署
### ReTag
```
docker tag springboot-hello-gke-image:v1 asia-east1-docker.pkg.dev/project-course-rd/springboot-hello-gke/springboot-hello-gke-image:v1
```


### Push
```
docker push asia-east1-docker.pkg.dev/project-course-rd/springboot-hello-gke/springboot-hello-gke-image:v1
```




### 登入GKE cluster
```
gcloud container clusters get-credentials $cluster-name --region asia-east1 --project project-course-rd
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
