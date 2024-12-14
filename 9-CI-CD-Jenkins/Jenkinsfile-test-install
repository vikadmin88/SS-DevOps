pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                // Checkout the repository containing the Jenkinsfile
                checkout scm
            }
        }

        stage('Install mc') {
            steps {
                sh '''
                    sudo apt update -y || sudo yum update -y
                    if command -v apt > /dev/null; then
                        sudo apt install -y mc
                    elif command -v yum > /dev/null; then
                        sudo yum install -y mc
                    fi
                '''
            }
        }

        stage('Check mc') {
            steps {
                sh '''
                    sudo whereis mc
                '''
            }
        }

        stage('Uninstall mc') {
            steps {
                sh '''
                    sudo apt remove -y mc
                '''
            }
        }
    }
}

