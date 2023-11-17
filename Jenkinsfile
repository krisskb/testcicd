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
        sh './mvnw package'
      }
    }

  }
}