node {
    def app

    try {

        stage('Cloning repository') {
            checkout scm
            sh 'mvn clean compile package'
        }

        stage('Building Image') {
            app = docker.build("eureka-server")
        }

        stage('Pushing Image') {
            docker.withRegistry('http://localhost:5000') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
        }

        stage('Updating Testing Server') {
      /*      sshagent (credentials: ['testing-server']) {
                sh 'ssh -o StrictHostKeyChecking=no -l admin -p 22 devnst01.nearshoretechnology.com /home/admin/update-nst-eureka-server-app.sh $BUILD_NUMBER'
            }
        */
        }

        stage('Running Tests') {

        }

    } catch (e) {
        // If there was an exception thrown, the build failed
        currentBuild.result = "FAILED"
        throw e
    } finally {

    }
}
