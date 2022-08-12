pipeline {
    agent any
    tools {
  terraform 'Terraform_CSS'
}
     environment {
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
    
}
