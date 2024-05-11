pipeline {
    agent any
    tools {
        maven 'Maven3'
        jdk 'java17'
    }

    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/brkbthn/DevopsPipelineExample']])
                sh 'mvn clean install'
            }
        }
         stage('Docker Image') {
            steps {
                sh 'docker build -t brkbthn/pipeline-example .'
            }
        }
          stage('Docker Image to DockerHub') {
            steps {
                sh 'docker build -t brkbthn/pipeline-example .'
                script{
                    withCredentials([string(credentialsId: 'Dockerhub', variable: 'dockerhub')]) {
                        sh 'docker login -u brkbthn -p ${dockerhub}'
                        sh 'docker push brkbthn/pipeline-example:latest'

                    }
                }
            }
        }


    }
}
