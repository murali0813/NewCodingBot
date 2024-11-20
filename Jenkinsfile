pipeline {
   agent any
   environment {
       DOCKER_IMAGE = 'sample-node-app:latest'
   }
   stages {
       stage('Checkout Code') {
           steps {
               // Clone the repository
               git branch: 'main', url: 'https://github.com/murali0813/NewCodingBot.git'
           }
       }
       stage('Build Docker Image') {
           steps {
               script {
                   // Build the Docker image
                   sh 'sudo docker build -t $DOCKER_IMAGE .'
               }
           }
       }
       stage('Deploy Docker Container') {
           steps {
               script {
                   // Stop any running container with the same name
                   sh '''
                   sudo docker stop sample-node-app || true
                   sudo docker rm sample-node-app || true
                   '''
                   // Run the new container
                   sh '''
                   sudo docker run -d --name sample-node-app -p 3000:3000 $DOCKER_IMAGE
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
