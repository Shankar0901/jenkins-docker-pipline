pipeline {
    agent any  // Use any available agent node by default
    stages {
        stage('Build on Linux') {
            agent {
                label 'linux'  // Allocate a node with the label 'linux'
            }
            steps {
                sh 'echo "Building on Linux"'
                // Other build steps for Linux
            }
        }
        
        stage('Build on Windows') {
            agent {
                label 'windows'  // Allocate a node with the label 'windows'
            }
            steps {
                bat 'echo "Building on Windows"'
                // Other build steps for Windows
            }
        }
    }
}
