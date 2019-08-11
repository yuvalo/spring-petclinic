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
  serviceAccountName: cd-jenkins
  containers:
  - name: maven
    image: maven:latest
    command:
    - cat
    tty: true
    volumeMounts:
      - mountPath: /
        name: m2
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
