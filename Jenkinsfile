pipeline {
    agent any

    environment {
        DOCKER_HOST = "http://192.168.17.153:2375" // Docker API endpoint
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
                    try {
                        echo "Starting Docker build..."
                        // Use PowerShell to call Docker build through API
                        def buildUrl = "${env.DOCKER_HOST}/build?t=python-app1:latest"
                        def response = powershell(script: """
                            \$response = Invoke-RestMethod -Uri '$buildUrl' -Method Post
                            Write-Output 'Response: ' + \$response
                        """, returnStdout: true).trim()

                        echo "Build response: ${response}"
                    } catch (Exception e) {
                        echo "Error during Docker build: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                    }
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

