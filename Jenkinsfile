node {
    def app
    def mvnHome = tool 'maven'
    env.PATH = "${mvnHome}/bin:${env.PATH}"
    echo "var mvnHome='${mvnHome}'"
    echo "var env.PATH='${env.PATH}'"
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
                sh 'ssh admin -p 22 devnst01.nearshoretechnology.com /home/admin/script/update-nst-eureka-server-app.sh $BUILD_NUMBER'
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
