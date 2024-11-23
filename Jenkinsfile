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
        stage('Deploy') {
            steps {
                script {
                    // Rebuild and redeploy Docker containers
                    sh 'docker-compose down --remove-orphans'
                    sh 'docker-compose up -d --build'
                }
            }
        }
    }
}

