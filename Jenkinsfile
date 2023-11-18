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

    stage('run_app') {
      steps {
        sh 'java -jar ./target/petclinic.2.3.1.BUILD-SNAPSHOT.jar'
      }
    }

  }
}
