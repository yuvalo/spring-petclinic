def project = 'silent-oasis-249511'
def  appName = 'test'

pipeline {
  agent {
    maven {
      image 'maven:latest'
    }
    docker {
      image 'docker:latest'
    }
  }
  stages {
    stage('Build') {
      steps {
        container('maven') {
          sh """
          		mvn package -DskipTests
						"""
        }
      }
    }
    stage('Test') {
      steps {
        container('maven') {
          sh """
             mvn test
          """
        }
      }
    }
    stage('Push') {
      steps {
        container('docker') {
          sh """
             docker build -t spring-petclinic-demo:$BUILD_NUMBER .
          """
        }
      }
    }
  }
} 
