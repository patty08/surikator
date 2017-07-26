pipeline {
  agent any
  stages {
    stage('initSurikator') {
      steps {
        echo 'Init Surikator build'
        git(url: 'https://github.com/sebastienmusso/infradatamgmt', branch: 'master')
        sh '''ls -l
docker version'''
      }
    }
    stage('Build') {
      steps {
        echo 'Building Surikator with Docker container'
        sh '''sh ./ci_code.sh
'''
      }
    }
    stage('Test Surikator') {
      steps {
        parallel(
          "Test DEV": {
            echo 'Dev test'
            sh 'docker ps'
            
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