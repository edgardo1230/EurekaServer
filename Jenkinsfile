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
            docker.withRegistry('http://cdcidev.nearshoretechnology.com:5000') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
        }

        stage('Updating Testing Server') {
                sh 'sudo ssh -o StrictHostKeyChecking=no -l admin  -p 22 devnst01.nearshoretechnology.com  "bash -s "< /opt/script/update-nst-eureka-server-app.sh $BUILD_NUMBER'
        }

        stage('Running Tests') {

        }


}
