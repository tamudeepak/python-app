pipeline {
    agent any
    environment {
        DOCKER_HOST = "tcp://192.168.17.153:2375"
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/tamudeepak/python-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Use powershell instead of sh for Windows
                    powershell """
                        docker -H tcp://192.168.17.153:2375 build -t python-app1:latest .
                    """
                }
            }
        }
    }
    post {
        success {
            echo 'Build successful! Docker image created.'
        }
        failure {
            echo 'Build failed! Check logs for details.'
        }
        always {
            echo 'Pipeline execution completed!'
        }
    }
}
