pipeline {
  agent any
  stages {
    stage('initSurikator') {
      steps {
        echo 'Init Surikator build'
        git(url: 'https://github.com/sebastienmusso/infradatamgmt', branch: 'patty')
        sh 'sh \'bash ./ci_init.sh\''
      }
    }
    stage('Build') {
      steps {
        echo 'BuildinngSurikator with Docker container'
        sh 'sh \'bash ./ci-code.sh\''
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