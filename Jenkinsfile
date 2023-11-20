pipeline {
  agent {
    node {
      label 'build'
    }
  }

  stages {
    stage('pull_source') {
      steps {
        git(url: 'https://github.com/krisskb/testcicd.git', branch: 'main', poll: true)
      }
    }

    stage('build_jar') {
      steps {
        sh 'mvn install -DskipTests=true'
      }
    }

    stage('docker_image') {
      steps {
        sh 'sudo docker image prune -a'
        sh 'sudo docker build . -t krisskb001/petclinic'
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        sh 'sudo docker push krisskb001/petclinic'
        sh 'sudo docker logout'
      }
    }

    stage('docker_container') {
      steps {
        sh 'sudo docker stop petclinic'
        sh 'sudo docker rm petclinic'
        sh 'sudo docker run --name petclinic -d -p 80:8080 krisskb001/petclinic'
      }
    }

  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
}
