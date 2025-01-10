pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Mohan-jagali/Manhattan.git'
            }
        }
        stage('Build Backend') {
            steps {
                sh 'docker build -t backend:latest ./backend'
            }
        }
        stage('Build Frontend') {
            steps {
                sh 'docker build -t project-frontend:latest ./frontend'
            }
        }
        stage('Deploy with Docker Compose') {
            steps {
              //  sh 'docker-compose up -d --build'
            }
        }
        stage('Deploy with Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}

