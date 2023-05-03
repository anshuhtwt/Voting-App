pipeline {
    agent any
    }

    stages {
    stage('Build and Push Docker Images') {
      steps {
        dir('vote') {
          script {
            def image_name = "${DOCKER_REGISTRY}/${DOCKER_IMAGE_PREFIX}/vote:${DOCKER_IMAGE_TAG}"
            sh "docker build -t ${image_name} ."
            sh "docker push ${image_name}"
          }
        }
        
        dir('result') {
          script {
            def image_name = "${DOCKER_REGISTRY}/${DOCKER_IMAGE_PREFIX}/result:${DOCKER_IMAGE_TAG}"
            sh "docker build -t ${image_name} ."
            sh "docker push ${image_name}"
          }
        }
      }
    }
    
    stage("Install kubectl on worker nodes"){
            steps {
                sh """
                    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
                    chmod +x ./kubectl
                    ./kubectl version --client
                """
            }
        }

    stage('Deploy to Cluster') {
      steps {
          sh "aws eks update-kubeconfig --region us-east-1 --name anshuhtwt"
        script {
          def kubectl = tool('kubectl')
          sh "${kubectl} apply -R -f k8s-manifest/voting-app"
          sh "${kubectl} apply -R -f k8s-manifest/redis"
          sh "${kubectl} apply -R -f k8s-manifest/postgres"
          sh "${kubectl} apply -R -f k8s-manifest/worker"
          sh "${kubectl} apply -R -f k8s-manifest/result-app"
        }
      }
    }
  }






