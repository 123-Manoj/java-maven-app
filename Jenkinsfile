pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "java-maven-app"
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
                bat 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run -d --name java-maven-container %DOCKER_IMAGE%'
            }
        }
    }

    post {
        always {
            bat 'docker ps -a'
        }
    }
}
