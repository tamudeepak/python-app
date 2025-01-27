pipeline {
    agent any
    environment {
        DOCKER_HOST = "tcp://192.168.17.153:2375" // Docker host IP and port
        DOCKER_IMAGE = "python-app1"
        DOCKER_TAG = "latest"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/tamudeepak/python-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image on the remote Docker host
                    sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                }
            }
        }
    }
    post {
        always {
            echo "Docker image build step completed!"
        }
    }
}

