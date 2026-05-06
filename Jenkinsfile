pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = 'docker.io'
        IMAGE_NAME = 'ghazanfar6/portfolio-app'
        IMAGE_TAG = "${BUILD_NUMBER}"
        GIT_REPO = 'https://github.com/Ghazanfar6/Ghazanfar6.github.io.git'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                git branch: 'main', url: '${GIT_REPO}'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
                sh 'docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:latest'
            }
        }
        
        stage('Test Docker Image') {
            steps {
                echo 'Testing container...'
                sh 'docker run -d -p 8081:8081 --name test-${BUILD_NUMBER} ${IMAGE_NAME}:${IMAGE_TAG}'
                sh 'sleep 5'
                sh 'curl http://localhost:8081 || exit 1'
                sh 'docker stop test-${BUILD_NUMBER}'
                sh 'docker rm test-${BUILD_NUMBER}'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing image to Docker Hub...'
                sh 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'
                sh 'docker push ${IMAGE_NAME}:latest'
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
                sh 'kubectl set image deployment/portfolio-app portfolio-app=${IMAGE_NAME}:${IMAGE_TAG}'
                sh 'kubectl rollout status deployment/portfolio-app'
            }
        }
    }
    
    post {
        always {
            sh 'docker image prune -f'
        }
    }
}
