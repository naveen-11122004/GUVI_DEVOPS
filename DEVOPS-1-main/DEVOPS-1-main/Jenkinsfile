pipeline {     
    agent any      
    
    environment {         
        BACKEND_IMAGE_NAME  = "mern-studentportal-backend"         
        FRONTEND_IMAGE_NAME = "mern-studentportal-frontend"         
        IMAGE_TAG           = "latest"         
        DOCKER_REGISTRY     = "docker.io"         
        DOCKER_REPO         = "naveen11122004" 
        KUBECONFIG = "/home/kiruthik/.kube/config"    
    }      

    stages {         
        stage('Checkout') {             
            steps {                 
                script {                     
                    git branch: 'main', url: 'https://github.com/naveen-11122004/DEVOPS-1.git'                 
                }             
            }         
        }          
        
        stage('Build Backend Image') {             
            steps {                 
                script {                     
                    dockerImageBackend = docker.build("${DOCKER_REPO}/${BACKEND_IMAGE_NAME}:${IMAGE_TAG}", "./MERN-StudentPortal-main/backend")                 
                }             
            }         
        }          

        stage('Build Frontend Image') {             
            steps {                 
                script {                     
                    dockerImageFrontend = docker.build("${DOCKER_REPO}/${FRONTEND_IMAGE_NAME}:${IMAGE_TAG}", "./MERN-StudentPortal-main/frontend")                 
                }             
            }         
        }          

        stage('Push Docker Images') {      
            steps {          
                script {              
                    sh 'docker login -u naveen11122004 -p "Naveen2004"'             
                    dockerImageBackend.push("${IMAGE_TAG}")              
                    dockerImageFrontend.push("${IMAGE_TAG}")          
                }      
            }  
        }            

       stage('Deploy to Minikube') {
    steps {
        script {
            sh 'kubectl apply -f deploy.yaml --kubeconfig=/home/kiruthik/.kube/config --validate=false'
        }
    }
       }   
    }  // <-- Closing `stages {}` block here

    post {         
        always {             
            echo "Pipeline execution completed."         
        }     
    } 
}
