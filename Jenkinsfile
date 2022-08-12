pipeline {
    agent any
    tools {
  terraform 'Terraform_CSS'
}
     environment {
        WEBEXAUTH = credentials('webex-auth-token')
        WEBEXROOM = credentials('webex-roomid')
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/Jorayala/Terraform_basic'
            }
        }
        stage('Terraform init') {
            steps {
                echo 'Terraform init'
                sh 'terraform init'
            }
        }
        stage('Terraform apply') {
            steps {
                echo 'Terraform apply'
                sh 'terraform apply --auto-approve'
            }
        }
    }
    post { 
        success { 
          
            wrap([$class: 'BuildUser']) {
            sh """
                    curl --location --request POST 'https://webexapis.com/v1/messages' \
--header "Authorization: Bearer ${WEBEXAUTH}" \
--header 'Content-Type: application/json' \
--data-raw '{
  "roomId": "${WEBEXROOM}",
  
  "markdown": "Started at: ${BUILD_TIMESTAMP}\\nAuthor:${env.BUILD_USER}(${env.BUILD_USER_EMAIL})\\nJob URL: ${Job_URL}\\nBuild ID: ${BUILD_NUMBER}\\nBuild Logs: ${BUILD_URL}consoleText\\nResult: ${currentBuild.currentResult}" 
}'
         """
                
            }
        }
        failure { 
            
            sh """
                    curl --location --request POST 'https://webexapis.com/v1/messages' \
--header "Authorization: Bearer ${WEBEXAUTH}" \
--header 'Content-Type: application/json' \
--data-raw '{
  "roomId": "${WEBEXROOM}",
  
  "markdown": "Started at: ${BUILD_TIMESTAMP}\\nAuthor:${env.BUILD_USER}(${env.BUILD_USER_EMAIL})\\nJob URL: ${Job_URL}\\nBuild ID: ${BUILD_NUMBER}\\nBuild Logs: ${BUILD_URL}consoleText\\nResult: ${currentBuild.currentResult}" 
}'
         """
            
        }
    }
    
}
