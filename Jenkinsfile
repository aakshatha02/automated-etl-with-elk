pipeline {
    agent any
    environment {
        PATH = "/opt/homebrew/bin:${env.PATH}"
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/aakshatha02/automated-etl-with-elk.git'
            }
        }
        stage('Set Date for API call') {
            steps {
                script {
                    // Running the script to calculate the dates and set the environment variables
                    def result = sh(script: "./set_dates.sh", returnStdout: true).trim()
                    echo "Set Date script output: ${result}"
                }
            }
        }
        stage('Stop any running Containers to avoid conflicts') {
            steps {
                sh 'docker-compose down'
            }
        }

        stage('Start Docker Containers') {
            steps {
                script {
                    sh 'docker-compose up -d'
   
                }
            }
        }
        
        stage('Process Data') {
            steps {
                script {
                    echo "Monitoring and analyzing data: Data flows from Logstash to Elasticsearch and is visualized in Kibana."
                    sleep(time: 5, unit: 'MINUTES')  
                }
            }
        }
    }
}
