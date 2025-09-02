pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "java-maven-app"
        DOCKER_CONTAINER = "java-maven-container"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/123-Manoj/java-maven-app.git',
                    credentialsId: 'github-credentials'
            }
        }

        stage('Build with Maven') {
            steps {
                bat '"C:\\Program Files\\Apache\\Maven\\maven-mvnd-1.0.2-windows-amd64\\bin\\mvnd.cmd" clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker rm -f %DOCKER_CONTAINER% || true'
                bat 'docker run -d -p 8080:8080 --name %DOCKER_CONTAINER% %DOCKER_IMAGE%'
            }
        }
    }

    post {
        always {
            bat 'docker ps -a'
        }
    }
}
