pipeline {
  agent any
  stages {
    stage('initSurikator') {
      steps {
        echo 'Init Surikator build'
        git(url: 'https://github.com/sebastienmusso/infradatamgmt', branch: 'patty')
      }
    }
    stage('Build') {
      steps {
        echo 'BuildinngSurikator with Docker container'
        sh '''docker-compose -f surikator.yml up
docker-compose -f elk_backEnd.yml up'''
      }
    }
    stage('Test Surikator') {
      steps {
        parallel(
          "Test DEV": {
            echo 'Dev test'
            sh '''curl localhost:5601
curl localhost:9200
curl localhost:12201'''
            
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