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
    stage('Push Docker image') {
            steps {
            container('docker') {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
          sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
          sh 'docker push teslaraj950/testing-image:${BUILD_NUMBER}'
          sh 'docker push teslaraj950/testing-image:latest'
        }
        }
      }
    }
      stage('Trigger ManifestUpdate') {
      steps {
              container('docker') {
        script {
          build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: '${BUILD_NUMBER}')], wait: true, propagate: true
        }
              }}
    }
}
}
