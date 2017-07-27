pipeline {
  agent {
    docker {
      image 'https://hub.docker.com/r/patsoo08/surikator/'
    }
    
  }
  stages {
    stage('initSurikator') {
      steps {
        echo 'Checking GitHub repository '
        git(url: 'https://github.com/sebastienmusso/infradatamgmt', branch: 'patty')
        sh 'ls -l'
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