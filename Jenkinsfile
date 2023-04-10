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
                changeset "**/ehr-crud/**"
            }
            steps {
                // Deployment steps
                echo "BYE"
            }
        }
    }
}
