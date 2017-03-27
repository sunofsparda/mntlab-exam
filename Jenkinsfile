node("${env.SLAVE}") {
  //tool name: 'Maven_3.3.9', type: 'maven'

  stage('Preparation (Checking out)') {
    echo "checkout scm" 
    checkout scm
  }

  stage("Build"){
    /*
        Update file src/main/resources/build-info.txt with following details:
    */
    pwd
    echo build artefact
    // cd ${WORKSPACE}
    sh "mvn clean package"
  }

  stage("Package"){
    /*
        use tar tool to package built war file into *.tar.gz package
    */
    sh "echo package artefact"
  }

  stage("Roll out Dev VM"){
    /*
        use ansible to create VM (with developed vagrant module)
    */
    sh "echo ansible-playbook createvm.yml ..."
  }

  stage("Provision VM"){
    /*
        use ansible to provision VM
        Tomcat and nginx should be installed
    */
    sh "echo ansible-playbook provisionvm.yml ..."
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

