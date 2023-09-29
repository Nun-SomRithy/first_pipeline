pipeline {
    agent {
        docker {
            image 'node:lts'
            args '-u root'
        }
    }

    stages {
        stage('Git Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/Nun-SomRithy/first_pipeline.git'
            }
        }
        stage('Build Images') {
            steps {
                sh  '''
                    docker build -t nextjs .
                '''
            }
        }
        stage('Deploy Images') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh '''
                        docker login -u $USERNAME -p $PASSWORD
                        docker tag nextjs  $USERNAME/nextjs:v1
                        docker push  $USERNAME/next:v1
                    '''
                }
            }
        }
    }
}
