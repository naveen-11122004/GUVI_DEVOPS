pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'naveen11122004/shop'
        DOCKER_TAG = 'latest'
        DOCKER_USERNAME = 'naveen11122004'         // Replace with your Docker Hub username
        DOCKER_PASSWORD = 'naveen2004'  // Replace with your Docker Hub password or token
        KUBE_DEPLOYMENT_NAME = 'shop-deployment'
        KUBE_NAMESPACE = 'default'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh """
                    echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh """
                    minikube start
                    kubectl set image deployment/${KUBE_DEPLOYMENT_NAME} shop-container=${DOCKER_IMAGE}:${DOCKER_TAG} -n ${KUBE_NAMESPACE} || \
                    kubectl apply -f deploy.yaml
                """
            }
        }
    }

    post {
        always {
            sh "docker logout"
        }
        success {
            echo "✅ Deployment completed successfully."
        }
        failure {
            echo "❌ Deployment failed. Check logs."
        }
    }
}
