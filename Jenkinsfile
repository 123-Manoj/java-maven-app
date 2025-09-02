pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'java-maven-app'
        CONTAINER_NAME = 'java-maven-container'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/123-Manoj/Sample.git'
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
                bat '''
                REM === Find and stop containers using port 8080 ===
                FOR /F "tokens=*" %%i IN ('docker ps -q --filter "publish=8080"') DO docker stop %%i
                FOR /F "tokens=*" %%i IN ('docker ps -aq --filter "publish=8080"') DO docker rm %%i

                REM === Run new container ===
                docker run -d -p 8080:8080 --name %CONTAINER_NAME% %DOCKER_IMAGE%
                '''
            }
        }
    }
}
