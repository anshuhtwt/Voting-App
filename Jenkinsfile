pipeline {
    agent any
    }

    stages {
        stage('Build and push Docker images') {
            steps {
                 withDockerRegistry([credentialsId: 'docker-hub', url: ""]) {
                    script {
                        def dockerImages = ['image1', 'image2']
                        for (def imageName in dockerImages) {
                            def dockerTag = "${env.BUILD_NUMBER}"
                            def dockerImage = "${DOCKER_HUB_USERNAME}/${imageName}:${dockerTag}"
                            def dockerFilePath = "Dockerfiles/${imageName}/Dockerfile"
                            docker.build(dockerImage, "--build-arg BUILD_NUMBER=${dockerTag} -f ${dockerFilePath} .").push()
                        }
                    }
                }
            }
        }
                   