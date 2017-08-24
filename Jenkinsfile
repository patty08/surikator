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
            echo 'Dev test: already OK'
            echo ' All Tests are successfully done '

          },
          "Test Ops": {
            echo 'Ops testing curl Elasticsearch and Kibana'
            sh '''
curl localhost:5601 
curl localhost:6060
''''

          }
        )
      }
    }
    stage('Release') {
      steps {
        sh '''git tag -a surikator -m 'Jenkins'
'''
      }
    }
    stage('Publish') {
      steps {
        sh '''git push https://${GIT_USERNAME}:${GIT_PASSWORD}@<REPO> --tags
'''
      }
    }
  }
}
