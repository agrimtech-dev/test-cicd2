pipeline {
    agent any

    environment {
        IMAGE_NAME     = 'test-cicd2-app'
        CONTAINER_NAME = 'test-cicd2-container'
        HOST_PORT      = '8090'
    }

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
                echo "Files in workspace:"
                sh 'ls -la'
            }
        }

        stage('Docker Image Build') {
            steps {
                echo "Docker image build ho rahi hai: ${IMAGE_NAME}"
                sh "docker build -t ${IMAGE_NAME}:latest ."
                echo "Image ready!"
            }
        }

        stage('Stop Old Container') {
            steps {
                echo "Purana container band kar rahe hain..."
                sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm   ${CONTAINER_NAME} || true
                """
            }
        }

        stage('Run New Container') {
            steps {
                echo "Naya container start ho raha hai..."
                sh """
                    docker run -d \
                        --name ${CONTAINER_NAME} \
                        -p ${HOST_PORT}:80 \
                        --restart unless-stopped \
                        ${IMAGE_NAME}:latest
                """
                sh "docker ps | grep ${CONTAINER_NAME}"
            }
        }

    }

    post {
        success {
            echo "SUCCESS! App live hai: http://localhost:${HOST_PORT}"
        }
        failure {
            echo "FAILED! Console Output dekho."
        }
    }
}
