
pipeline {
  agent {
    kubernetes {
      label 'spring-petclinic'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  containers:
  - name: maven
    image: maven:latest
    command:
    - cat
    tty: true
  - name: kubectl
    image: gcr.io/cloud-builders/kubectl
    command:
    - cat
    tty: true
"""
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
  stages {
    stage('Test') {
      steps {
        container('maven') {
          sh """
             mvn test
          """
        }
      }
    }
  
  }
}
} 
