pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'java-maven-app'
        CONTAINER_NAME = 'java-maven-container'
        HOST_PORT = '9090'
        APP_PORT = '8080'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/123-Manoj/Sample.git'
            }
        }

        stage('Build with Maven') {
            steps {
                bat '"C:\\Program Files\\Apache\\Maven\\maven-mvnd-1.0.2-windows-amd64\\bin\\mvnd.cmd" clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Remove old container
                bat 'docker rm -f %CONTAINER_NAME% || exit 0'

                // Run new container on port 9090
                bat 'docker run -d -p %HOST_PORT%:%APP_PORT% --name %CONTAINER_NAME% %DOCKER_IMAGE%'
            }
        }
    }

    post {
        success {
            echo "✅ Application deployed! Access it at http://localhost:${env.HOST_PORT}"
        }
        failure {
            echo "❌ Build/Deploy failed. Check Jenkins logs."
        }
    }
}
