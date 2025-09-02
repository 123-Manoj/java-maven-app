pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "java-maven-app"
        CONTAINER_NAME = "java-maven-container"
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
                // Stop/remove any container already using port 8080
                bat 'for /f "tokens=*" %i in (\'docker ps -q --filter "publish=8080"\') do docker stop %i && docker rm %i'

                // Remove old container with the same name (if exists)
                bat 'docker rm -f %CONTAINER_NAME% || true'

                // Run new container on port 8080
                bat 'docker run -d -p 8080:8080 --name %CONTAINER_NAME% %DOCKER_IMAGE%'
            }
        }
    }

    post {
        always {
            bat 'docker ps -a'
        }
    }
}
