pipeline {
    agent any
    environment {
        DOCKER_API = "http://192.168.17.153:2375"
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
                    powershell '''
                        $ErrorActionPreference = 'Stop'
                        
                        # Create build context tar
                        Compress-Archive -Path * -DestinationPath build.zip
                        
                        # Build image using Docker API
                        $buildUrl = "${env:DOCKER_API}/build?t=python-app1:latest"
                        
                        Write-Host "Starting Docker build via API..."
                        Invoke-WebRequest -Uri $buildUrl -Method POST -InFile build.zip -ContentType "application/x-tar"
                        
                        Write-Host "Build completed successfully!"
                    '''
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
            powershell 'Remove-Item -Path build.zip -ErrorAction SilentlyContinue'
        }
    }
}
