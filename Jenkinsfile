pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'python-app1'  // Name of the Docker image to build
        DOCKER_TAG = 'latest'       // Tag for the Docker image
    }

    stages {
        stage('Checkout') {
            steps {
                // Step 1: Checkout code from GitHub repository
                git branch: 'master', url: 'https://github.com/tamudeepak/python-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Step 2: Build Docker image from Dockerfile
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }
    }

    post {
        always {
            // Log message once pipeline step is complete
            echo "Docker image build step completed!"
        }
    }
}

