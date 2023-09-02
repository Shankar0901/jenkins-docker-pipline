

    

        // Additional stages or post-build actions
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from Git
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: 'main']], // Specify the branch you want to build
                    userRemoteConfigs: [[
                        url: 'https://github.com/Shankar0901/jenkins-docker-pipline', // Replace with your Git repository URL
                        credentialsId: '134193089' // Replace with the ID of your Jenkins Git credentials
                    ]]
                ])
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = 'jenkins-custom' // Replace with your desired image name
                    def dockerFile = 'Dockerfile' // Path to your Dockerfile for Jenkins

                    // Build the Docker image
                    sh "docker build -t $dockerImage -f $dockerFile ."
                }
            }
        }

        stage('Run Jenkins Container') {
            steps {
                script {
                    def dockerContainerName = 'jenkins-container' // Replace with your desired container name
                    def jenkinsPort = '8080:8080' // Port mapping (hostPort:containerPort)

                    // Run the Jenkins container from the built image
                    sh "docker run -d --name $dockerContainerName -p $jenkinsPort $dockerImage"
                }
            }
        }

        // Additional stages or post-build actions
    }

    post {
        success {
            // Actions to perform when the pipeline succeeds
            echo 'Docker image build and Jenkins container started successfully!'
        }

        failure {
            // Actions to perform when the pipeline fails
            echo 'Docker image build or Jenkins container startup failed! Sending notifications...'
            // Add steps for sending notifications or cleanup here
        }
    }
}
