pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "gedanghijau25/demo-app:latest"
        NOMAD_ADDR   = "http://172.16.2.233:4646"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/gedanghijau25/demo-app.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([ credentialsId: 'gedanghijau25', url: '' ]) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to Nomad') {
            steps {
                sh 'nomad job run -address=$NOMAD_ADDR nomad-job.hcl'
            }
        }
    }
}
