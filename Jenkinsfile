node {
    def app
    def mvnHome = tool 'maven'
    env.PATH = "${mvnHome}/bin:${env.PATH}"
    echo "var mvnHome='${mvnHome}'"
    echo "var env.PATH='${env.PATH}'"
        stage('Cloning repository') {
            checkout scm
            sh 'mvn clean compile package'
        }

        stage('Building Image') {
            app = docker.build("eureka-server")
        }

        stage('Pushing Image') {
            docker.withRegistry('http://devnst01.nearshoretechnology.com:5000') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
        }

        stage('Updating Testing Server') {
                sh 'ssh -o StrictHostKeyChecking=no admin@devnst01.nearshoretechnology.com /home/admin/script/update-nst-eureka-server-app.sh'
        }

        stage('Running Tests') {

        }


}
