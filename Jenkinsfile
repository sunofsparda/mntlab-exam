node("${env.SLAVE}") {
tool name: 'Maven_3.3.9', type: 'maven'

  stage('Preparation (Checking out)') {
    echo "checkout scm" 
    checkout scm
  }

  stage("Build"){
    sh "mvn clean package -DbuildNumber=$BUILD_NUMBER"
  }

  stage("Package"){
    sh "echo package artefact"
    echo 'Creating new artifact'
      sh '''
          cp ${WORKSPACE}/target/mnt-exam.war ${WORKSPACE}/mnt-exam.war
          tar -czf mnt-exam.war.tar.gz mnt-exam.war
      ''';
    archiveArtifacts artifacts: 'mnt-exam.war.tar.gz', onlyIfSuccessful: true
  }

  stage("Roll out Dev VM"){
    sh "cd ansible/playbooks/ && ansible-playbook createvm.yml -e WORKSPACE=${WORKSPACE}"
  }

  stage("Provision VM"){
    sh "echo ansible-playbook ansible/playbooks/provisionvm.yml ..."
  }

  stage("Deploy Artefact"){
    /*
        use ansible to deploy artefact on VM (Tomcat)
        During the deployment you should create file: /var/lib/tomcat/webapps/deploy-info.txt
        Put following details into this file:
        - Deployment time
        - Deploy User
        - Deployment Job
    */
    sh "echo ansible-playbook deploy.yml -e artefact=... ..."
  }

  stage("Test Artefact is deployed successfully"){
    /*
        use ansible to artefact on VM (Tomcat)
        During the deployment you should create file: /var/lib/tomcat/webapps/deploy-info.txt
        Put following details into this file:
        - Deployment time
        - Deploy User
        - Deployment Job
    */
    sh "echo ansible-playbook application_tests.yml -e artefact=... ..."
  }

}

