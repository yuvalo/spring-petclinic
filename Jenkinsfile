def project = 'silent-oasis-249511'
def  appName = 'test'

pipeline {
  stages {
    stage('Build') {
     agent {
             docker { image 'maven:latest' }
     }
      steps {
          sh """
          		mvn package -DskipTests
						"""
      }
    }
    stage('Test') {
      agent {
        docker {image 'maven:latest'} 
      }
      steps {
          sh """
             mvn test
          """
      }
    }
    stage('Push') {
			agent {
				docker {image 'docker:latest'}
			} 
      steps {
          sh """
             docker build -t spring-petclinic-demo:$BUILD_NUMBER .
          """
      }
    }
  }
} 
