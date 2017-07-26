pipeline {
  agent any
  stages {
    stage('initSurikator') {
      steps {
        echo 'Init Surikator build'
        git(url: 'https://github.com/sebastienmusso/infradatamgmt', branch: 'patty')
        sh '''sh "git rev-parse HEAD > .git/commit-id"
def commit_id = readFile('.git/commit-id').trim()
println commit_id'''
      }
    }
    stage('Build') {
      steps {
        echo 'BuildinngSurikator with Docker container'
        sh '''echo "---------------------------------------------------------------------------------"
echo " Stage Init: Initialisation of Surikator"
echo "---------------------------------------------------------------------------------"

echo "Surikator is tested on docker version 17.03 and 17.04"
docker version

echo "docker "
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
        sh '''app.push 'master'
app.push "${commit_id}"'''
      }
    }
  }
}