# ABC Technologies – Corporate Website with CI/CD Pipeline

A static corporate website for ABC Technologies (Home, About Us, Services, Careers, Contact Us). The site is packaged into a Docker image by a Jenkins pipeline and deployed to a local Kubernetes cluster. Monitoring is set up with Nagios, Graphite and Grafana.

## Folder contents

| File | Purpose |
|---|---|
| `index.html`, `about.html`, `services.html`, `careers.html`, `contact.html` | Static pages with a shared navigation bar |
| `Dockerfile.txt` | Builds the site on `nginx:alpine` and serves it on port 80 |
| `Jenkinsfile.txt` | Declarative Jenkins pipeline: clone, build the Docker image, deploy to Kubernetes |
| `Screenshots/` | Screenshots of the Jenkins run, Docker build, Kubernetes deployment, Nagios, Graphite, Grafana and the running app |
| `23BCE8392_Tippana_Jayanth_DevOps_Report.pdf` | Project report |

The `.txt` suffix on `Dockerfile` and `Jenkinsfile` is not part of the standard names. Rename them to `Dockerfile` and `Jenkinsfile` before running the pipeline.

The GitHub repository (`Jayanth0000/23BCE8392_Tippana_Jayanth_DevOps_Project`) also contains `k8s-deployment.yaml` and `k8s-service.yaml`. Those two manifests are not in this local folder.

## Pipeline

1. **Clone:** Jenkins checks out the repository from GitHub. The "Clone Repository" stage only prints a message.
2. **Build:** `docker build -t abctechnologies-web:latest .` packages the site. The Dockerfile copies all files into `/usr/share/nginx/html/`.
3. **Deploy:** `kubectl apply -f k8s-deployment.yaml` and `kubectl apply -f k8s-service.yaml` create the deployment and service.

### Kubernetes objects

- **Deployment** `abc-company-website`: 2 replicas, `imagePullPolicy: IfNotPresent` so the locally built image is used.
- **Service** `abc-web-service`: type `LoadBalancer`, port 80 to container port 80.

## Environment described in the report

The report describes a setup that runs on a single Windows machine, not in containers:

- Jenkins runs natively from the Java executable on JDK 21.
- Docker Engine and kubectl run on the host.
- Kubernetes runs through Docker Desktop.

## Running it

```bash
docker build -t abctechnologies-web:latest .
docker run -d -p 8080:80 abctechnologies-web:latest   # open http://localhost:8080
```

To deploy to Kubernetes manually (from the GitHub repo, where the manifests live):

```bash
kubectl apply -f k8s-deployment.yaml
kubectl apply -f k8s-service.yaml
kubectl get svc abc-web-service
```

## Monitoring

The report and screenshots cover three monitoring tools:

- **Nagios** checks host availability and endpoint status.
- **Graphite** stores time-series metrics.
- **Grafana** shows the metrics on dashboards.

The configuration for these tools is not in this repository.
