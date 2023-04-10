pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Build steps
                echo "HI"
            }
        }
        stage('Deploy') {
            when {
                changeset "**helm/ehr-crud/**"
            }
            steps {
                // Deployment steps
                echo "BYE"
              
            }
        }
    }
}
