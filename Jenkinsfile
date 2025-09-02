pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'java-maven-app'
        CONTAINER_NAME = 'java-maven-container'
        HOST_PORT = '9090'
        CONTAINER_PORT = '8080'
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
                // Remove old container
                bat 'docker rm -f %CONTAINER_NAME% || exit 0'

                // Run new container
                bat 'docker run -d -p %HOST_PORT%:%CONTAINER_PORT% --name %CONTAINER_NAME% %DOCKER_IMAGE%'
            }
        }

        stage('Post-Deployment Info') {
            steps {
                bat '''
                echo === Running Containers ===
                docker ps -a

                echo.
                echo Application is running at: http://localhost:%HOST_PORT%
                '''
            }
        }
    }
}
