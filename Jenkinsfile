pipeline {
  agent any
  stages {
    stage('initSurikator') {
      steps {
        ws(dir: 'CISurikator') {
          git(url: 'https://github.com/patty08/surikator', branch: 'master')
          fileExists '/rooter/configuration/metricbeat/metricbeat.yml'
        }
        
        sh '''ls -l 
docker version
docker-compose version
docker ps'''
      }
    }
    stage('Build') {
      steps {
        sh '''docker run -d patsoo08/surikator
docker run -d patsoo08/metricbeat
docker run -d patsoo08/elasticsearch
docker run -d patsoo08/kibana

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
            sh '''sleep 30
curl localhost:5601
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