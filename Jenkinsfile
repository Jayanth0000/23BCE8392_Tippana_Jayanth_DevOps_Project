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
                bat 'docker build -t abctechnologies-web:latest .'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying the container to Kubernetes cluster...'
                bat 'kubectl apply -f k8s-deployment.yaml'
                bat 'kubectl apply -f k8s-service.yaml'
            }
        }
    }
}
