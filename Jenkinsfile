pipeline {
    agent any
    environment {
        DOCKER_HOST = "tcp://192.168.17.153:2375" // Docker API endpoint on Ubuntu VM
    }
    stages {
        stage('Checkout Code') {
            steps {
                // Checkout your Python app from GitHub
                git branch: 'master', url: 'https://github.com/tamudeepak/python-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Use sh instead of bat since we're connecting to Linux Docker daemon
                    sh """
                        docker build -t python-app1:latest .
                    """
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution completed!'
        }
    }
}
