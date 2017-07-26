pipeline {
  agent any
  stages {
    stage('initSurikator') {
      steps {
        echo 'Init Surikator build'
        git(url: 'https://github.com/sebastienmusso/infradatamgmt', branch: 'patty')
        sh 'ci_init'
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
            sh 'sh \'bash ./ci-dev.sh\''
            
          },
          "Test Ops": {
            echo 'Ops test'
            sh 'sh \'bash ./ci-ops.sh\''
            
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