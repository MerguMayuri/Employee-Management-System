pipeline {
  agent any

  tools {
    maven 'Maven 3.9.4'
  }

  environment {
    DOCKER_BUILDKIT = '1'
  }

  stages { 
    stage('Checkout') {
      steps {
        git credentialsId: 'github-creds', url: 'https://github.com/MerguMayuri/Employee-Management-System.git'
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
