pipeline {
   agent any
   environment {
       DOCKER_IMAGE = 'your-dockerhub-username/sample-node-app:latest'
   }
   stages {
       stage('Checkout Code') {
           steps {
               // Clone the repository
               git branch: 'main', url: 'https://github.com/your-repo/sample-node-app.git'
           }
       }
       stage('Build Docker Image') {
           steps {
               script {
                   // Build the Docker image
                   sh 'docker build -t $DOCKER_IMAGE .'
               }
           }
       }
       stage('Push Docker Image to Registry') {
           steps {
               script {
                   // Log in to Docker Hub (use Jenkins credentials)
                   withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                       sh 'docker push $DOCKER_IMAGE'
                   }
               }
           }
       }
       stage('Deploy Docker Container') {
           steps {
               script {
                   // Stop any running container with the same name
                   sh '''
                   docker stop sample-node-app || true
                   docker rm sample-node-app || true
                   '''
                   // Run the new container
                   sh '''
                   docker run -d --name sample-node-app -p 3000:3000 $DOCKER_IMAGE
                   '''
               }
           }
       }
   }
   post {
       always {
           echo 'Pipeline execution completed.'
       }
   }
}
