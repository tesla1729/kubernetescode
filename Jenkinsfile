pipeline {
  agent any 
  stages {
  stage('checkout') {
    steps {
      checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/tesla1729/kubernetescode.git']])
    }
  }
  stage('build image') {
    steps {
      app = docker.build("teslaraj950/test")     
    }
  }

}

}
