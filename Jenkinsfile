node('master') {
    
    stage("Git checkout"){
    
git credentialsId: '5dd122fd-1354-4152-a5a3-01328b4ecee6', url: 'https://github.com/Olaprog/Advancly_BDD.git'

    }
    
    stage("NPM Package"){
        
    bat label: 'Install NPM', script: 'npm install' 
    
    }
    
    stage("Compile & Run test"){
          
         script: 'npm run chromebrowser' 
    }

    stage("Generate Test Report") {
      
         script: 'npm run merge:reports' 
         script: 'npm run create:html:report' 

    }

    stage("Send Email Attachment") {
     
     emailext attachmentsPattern: '**/cypress-tests-report.html',
     body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
     recipientProviders: [developers(), requestor()],
     subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
    
    }

}

    
  
