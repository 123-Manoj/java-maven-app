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
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name java-maven-container $DOCKER_IMAGE'
            }
        }
    }

    post {
        always {
            sh 'docker ps -a'
        }
    }
}
