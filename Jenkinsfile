pipeline {
	agent any 

   	stages {
        	stage('Clone') {
			steps {
              			git 'https://github.com/silogwire/Tp_Docker.git'
       			 }
		}	
		stage('Build') {
                	steps {
	               		 sh 'mvn  -B -DskipTests clean package'
       			 }
		}
                 stage('archive artifacts') {
                         steps {
                                 sh 'mvn test'
                }
                         post {
                                 always {

                                         stash(name: 'artifact', includes: 'target/*.war')
                                         stash(name: 'pom', includes: 'pom.xml')
                                         // to add artifacts in jenkins pipeline tab (UI)
                                         archiveArtifacts 'target/*.war'
                                 }
                          }
                }
                stage('Docker Build') {
                        steps {
                                sh 'docker build -t sihamlogwire/account:1.0 .'
                         }
                }

                stage('Test Image') {
                        steps {
                                 sh 'docker run -tid -p  8082:8080 sihamlogwire/account:1.0'
                         }
                }


                 stage('Docker Push') {
                        steps {
                                withCredentials([usernamePassword(credentialsId:'dockerHub',passwordVariable: 'dockerHubPassword',usernameVariable: 'dockerHubUser')]) {
                                        sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                                        sh 'docker push sihamlogwire/account:1.0'
                                 }
		
			}
		}
	}
}
