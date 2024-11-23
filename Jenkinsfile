pipeline {
    agent any
    environment {
        imageName = 'ruby-app'
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the code from SCM
                    checkout scm
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image for Ruby app locally
                    sh "docker build -t ${imageName} ."
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Rebuild and redeploy Docker containers
                    sh 'docker-compose down'
                    sh 'docker-compose up -d --build'
                }
            }
        }
    }
}

