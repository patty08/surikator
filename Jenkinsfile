pipeline {
  agent none
  stages {
    stage('initSurikator') {
      steps {
        ws(dir: 'wrk') {
          git(url: 'https://github.com/patty08/surikator', branch: 'master')
        }
        
        sh '''ls -l 
docker version
docker-compose version
docker ps'''
      }
    }
    stage('Build') {
      steps {
        sh 'docker-compose -f surikator.yml up'
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