pipeline {
  agent any
  stages {
    stage('initSurikator') {
      steps {
        echo 'Checking GitHub repository '
        git(url: 'https://github.com/patty08/surikator', branch: 'master')
        sh 'ls -l'
        sh 'docker version'
      }
    }
    stage('Build') {
      steps {
        echo 'Building Surikator with Docker container'
        load 'build.groovy'
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