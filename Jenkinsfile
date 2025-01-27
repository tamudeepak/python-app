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
                        
                        # First, let's verify Docker API is accessible
                        try {
                            $testApi = Invoke-WebRequest -Uri "${env:DOCKER_API}/version" -Method GET
                            Write-Host "Docker API is accessible"
                        } catch {
                            throw "Cannot connect to Docker API: $_"
                        }
                        
                        # Send Dockerfile and context directly
                        $headers = @{
                            'Content-Type' = 'application/x-tar'
                        }
                        
                        $buildUrl = "${env:DOCKER_API}/build?t=python-app1:latest"
                        
                        Write-Host "Starting Docker build via API..."
                        
                        # Read Dockerfile content
                        $dockerfileContent = Get-Content -Path Dockerfile -Raw
                        
                        # Create a simple tar-like structure
                        $body = [System.Text.Encoding]::UTF8.GetBytes($dockerfileContent)
                        
                        try {
                            $response = Invoke-RestMethod -Uri $buildUrl -Method Post -Body $body -Headers $headers
                            Write-Host "Build Response: $response"
                        } catch {
                            Write-Host "Error during build: $_"
                            throw

