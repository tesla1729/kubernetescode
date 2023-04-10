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
                changeset "path/to/your/file"
            }
            steps {
                // Deployment steps
                echo "BYE"
            }
        }
    }
}
