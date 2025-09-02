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
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Stop and remove any container using port 8080
                bat '''
                for /f "tokens=*" %%i in ('docker ps -q --filter "publish=8080"') do docker stop %%i
                for /f "tokens=*" %%i in ('docker ps -aq --filter "publish=8080"') do docker rm %%i
                '''

                // Remove old container with same name (ignore errors if not exists)
                bat 'docker rm -f %CONTAINER_NAME% || exit 0'

                // Run new container on port 8080
                bat 'docker run -d -p 8080:8080 --name %CONTAINER_NAME% %DOCKER_IMAGE%'
            }
        }
    }
}
