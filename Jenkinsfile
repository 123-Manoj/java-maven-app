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

        stage('Remove Old Container') {
            steps {
                bat 'docker rm -f %CONTAINER_NAME% || true'
            }
        }

        stage('Remove Old Docker Image') {
            steps {
                bat 'docker rmi -f %DOCKER_IMAGE% || true'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Run Docker Container') {
            steps {
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
