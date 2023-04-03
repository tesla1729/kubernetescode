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
    stage('Build-Docker-Image') {
      steps {
        container('docker') {
          script {
          dockerImage = docker.build teslaraj950/testing-image:latest
        }
        }
      }
    }
    stage('Login-Into-Docker') {
      steps {
        container('docker') {
          sh 'docker login -u teslaraj950 -p Tesla@123'
      }
    }
    }
     stage('Push-Images-Docker-to-DockerHub') {
      steps {
        container('docker') {
          sh 'docker push teslaraj950/testing-image:latest'
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
