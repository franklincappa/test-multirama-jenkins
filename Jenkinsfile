pipeline {
    agent any

    environment {
        IMAGE_BASE = "test-multirama-jenkins"
        GIT_REPO = "https://github.com/franklincappa/test-multirama-jenkins.git"
        BRANCH = "${env.BRANCH_NAME}"
    }

    stages {
        stage('Clonar Código') {
            steps {
                git url: '${GIT_REPO}', branch: "${BRANCH}"
            }
        }

        stage('Construir Imagen') {
            steps {
                script {
                    def tag = "${IMAGE_BASE}:${BRANCH}"
                    sh "docker build --build-arg NEST_ENV=${BRANCH} -t ${tag} ."
                }
            }
        }

        stage('Desplegar por Entorno') {
            steps {
                script {
                    def puerto = ""
                    def contenedor = "${IMAGE_BASE}-${BRANCH}"

                    if (BRANCH == "master") {
                        puerto = "5003"
                    } else if (BRANCH == "staging") {
                        puerto = "5002"
                    } else {
                        puerto = "5001"
                    }

                    def tag = "${IMAGE_BASE}:${BRANCH}"

                    sh "docker stop ${contenedor} || true"
                    sh "docker rm ${contenedor} || true"
                    sh "docker run -d --name ${contenedor} -e NEST_ENV=${BRANCH} -p ${puerto}:3000 ${tag}"
                }
            }
        }
    }
}
