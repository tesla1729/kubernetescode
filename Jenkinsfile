pipeline {
agent {
        kubernetes {
            label 'dind'
            containerTemplate {
                name 'docker'
                image 'docker:dind'
                privileged true
                ttyEnabled true
            }
        }
    }
  stages {
    stage('Clone') {
      steps {
        container('docker') {
          git branch: 'main', changelog: false, poll: false, url: 'https://github.com/tesla1729/kubernetescode.git'
        }
      }
    }  
    stage('Build') {
       steps {
               container('docker') {
                sh 'docker build -t teslaraj950/testing-image:latest -t teslaraj950/testing-image:$BUILD_NUMBER .'
            }
         } 
        }
    stage('Login-Into-Docker') {
      steps {
        container('docker') {
                docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {    
          sh 'docker push teslaraj950/testing-image:latest'
          sh 'docker push teslaraj950/testing-image:$BUILD_NUMBER'
      }
        }}
    }
     stage('Push-Images-Docker-to-DockerHub') {
      steps {
        container('docker') {
          sh 'docker push teslaraj950/testing-image:latest'
          sh 'docker push teslaraj950/testing-image:$BUILD_NUMBER'
      }
    }
     }
  }
    post {
      always {
        container('docker') {
          sh 'docker logout'
      }
      }
    }
}
