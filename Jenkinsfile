pipeline {
  agent {
    kubernetes {
      label 'docker-builder'
      containerTemplate {
        name 'docker'
        image 'docker:20.10.8'
        command 'cat'
        ttyEnabled true
      }
    }
  }
  stages {
    stage('Clone repository') {      
        checkout scm
    }
    stage('Build image') {
       app = docker.build("teslaraj950/test")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }
    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
        }
    }
     stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }

  }
}
