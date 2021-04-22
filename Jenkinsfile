node('master') {
    
    stage("Git checkout"){
    
git credentialsId: '5dd122fd-1354-4152-a5a3-01328b4ecee6', url: 'https://github.com/Olaprog/Advancly_BDD.git'

    }
    
    stage("NPM Package"){
        
    bat label: 'Install NPM', script: 'npm install --save-dev cypress' 
    
    }
    
    stage("Compile & Run test"){
        script: 'npm run clean:reports:' 
        bat label: 'Run test', script: 'npm run chromebrowser' 
    }

    stage("Generate Test Report") {
      
         script: 'npm run merge:reports' 
          script: 'npm run create:html:report' 

    }

    stage("Send Email Attachment") {
     
     emailext attachmentsPattern: '**/cypress-tests-report.html',
     mimeType: 'text/html',
     body: "${env.BUILD_URL} has result ${currentBuild.result}\n More info at: ${env.BUILD_URL}",
     recipientProviders: [developers(), requestor()],
     subject: ""Status of pipeline: ${currentBuild.fullDisplayName}"
    
    }

}

    
  
