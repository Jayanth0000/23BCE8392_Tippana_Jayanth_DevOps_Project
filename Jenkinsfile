pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning source code from GitHub...'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build -t abctechnologies-web:latest .'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying the container to Kubernetes cluster...'
                sh 'kubectl apply -f k8s-deployment.yaml'
                sh 'kubectl apply -f k8s-service.yaml'
            }
        }
    }
}
