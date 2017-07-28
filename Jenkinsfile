pipeline {
  agent any
  stages {
    stage('initSurikator') {
      steps {
        git(url: 'https://github.com/patty08/surikator', branch: 'master')
        sh 'docker-compose -f surikator.yml up'
      }
    }
    stage('Build') {
      steps {
        sh 'docker ps'
      }
    }
    stage('Test Surikator') {
      steps {
        parallel(
          "Test DEV": {
            echo 'Dev test'
            
          },
          "Test Ops": {
            echo 'Ops test'
            sh '''curl localhost:5601
curl localhost:6060'''
            
          }
        )
      }
    }
    stage('Release') {
      steps {
        sh 'def app = docker.build "Suriator"'
      }
    }
    stage('Publish') {
      steps {
        sh 'app.push \'CI_Jenkins\''
      }
    }
  }
}