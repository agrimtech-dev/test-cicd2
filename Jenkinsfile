pipeline {
    agent any

    stages {

        stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Repository') {
            steps {
                echo "Repo clone ho rahi hai..."
                git branch: 'main',
                    url: 'https://github.com/agrimtech-dev/test-cicd2.git'
                echo "Files copy ho gayi!"
                sh 'ls -la'
            }
        }

    }

    post {
        success {
            echo "SUCCESS! Files yahan hain: /var/jenkins_home/workspace/Test"
        }
        failure {
            echo "FAILED!"
        }
    }
}
