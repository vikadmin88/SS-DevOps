pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                // Checkout the repository containing the Jenkinsfile
                checkout scm
            }
        }

        stage('Install HTTPD') {
            steps {
                // Install Apache HTTPD on the target server
                sh '''
                    sudo apt update -y || sudo yum update -y
                    if command -v apt > /dev/null; then
                        sudo apt install -y apache2
                        sudo usermod -aG adm jenkins
                    elif command -v yum > /dev/null; then
                        sudo yum install -y httpd
                        sudo usermod -aG apache jenkins
                    fi
                '''
            }
        }

        stage('Start HTTPD') {
            steps {
                // Start the Apache service
                sh '''
                    if command -v systemctl > /dev/null; then
                        sudo systemctl start apache2 || sudo systemctl start httpd
                        sudo systemctl enable apache2 || sudo systemctl enable httpd
                    else
                        sudo service apache2 start || sudo service httpd start
                    fi
                '''
            }
        }

        stage('Status of HTTPD') {
            steps {
                // Status of the Apache service
                sh '''
                    if command -v systemctl > /dev/null; then
                        sudo systemctl status apache2 || sudo systemctl status httpd
                    else
                        sudo service apache2 status || sudo service httpd status
                    fi
                '''
            }
        }
    }
}

