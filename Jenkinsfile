pipeline {
    agent any

    environment {
        DOCKER_HOST = "http://192.168.17.153:2375" // Docker API endpoint
        DOCKERFILE = "Dockerfile" // Ensure the Dockerfile is named and accessible in your repo
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
                        echo "Starting Docker build via API..."

                        // Set up build URL for Docker API
                        def buildUrl = "${env.DOCKER_HOST}/build?t=python-app1:latest"

                        // Build request using PowerShell to call the Docker API
                        def response = powershell(script: """
                            \$dockerBuildUrl = '$buildUrl'
                            \$dockerFilePath = '${env.DOCKERFILE}'
                            
                            # Define the body of the Docker build request
                            \$body = @{
                                'dockerfile' = \$dockerFilePath
                                # Optional: If Docker context or other params are needed
                                'context' = '.'
                            } | ConvertTo-Json

                            # Invoke the REST method
                            \$response = Invoke-RestMethod -Uri \$dockerBuildUrl -Method Post -Body \$body -ContentType 'application/json'
                            
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

