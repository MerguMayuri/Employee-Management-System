pipeline {
  agent any

// Uncommented tools section

  tools {
    maven 'Maven 3.9.4'
  }

  environment {
    DOCKER_BUILDKIT = '1'
  }
// checkout is duplicate hence commented the checkout stage
 stages { 
  
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
  
    stage('Build') {
      steps {
        sh 'mvn clean package -DskipTests'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t employee-management-app .'
      }
    }

    stage('Docker Compose Up') {
      steps {
        sh 'docker-compose up -d'
      }
    }
  }
}
