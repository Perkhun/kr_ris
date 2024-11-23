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
                    // Зупиняємо контейнери, якщо вони існують
                    sh '''
                        if [ $(docker ps -aq | wc -l) -gt 0 ]; then
                            docker stop $(docker ps -aq)
                            docker rm $(docker ps -aq)
                        fi
                    '''
                    // Перезапускаємо Docker-контейнери
                    sh 'docker-compose up -d --build'
                }
            }
        }
    }
}

