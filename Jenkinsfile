pipeline{
  agent any
  tools{
   maven 'MAVEN_HOME'
  }
  
  stages{
    stage('checkout git'){
      steps{
          git branch: 'main', url: 'https://github.com/shashikrpet/Insurance.git'
      }
    }

    stage ('maveen package')
    {
      steps{
      sh 'mvn clean package'
        }
    }

    stage ('HTML report')
    {
      steps{
publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/Insurance/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
      }
    }

    stage('docker file and image')
          {
            steps{
                 sh 'docker build -t shashikrpet/insure-app:2.0 .'
            }
          }
    
stage('Docker image push') {
    steps {
    withCredentials([usernameColonPassword(credentialsId: 'D_log', variable: 'docker_log')]) {
          sh ' docker login -u shashikrpet -p ${docker_log}'
}
      sh 'docker push shashikrpet/insure-app:2.0 .'
      
            }
        }
    }
}


    
