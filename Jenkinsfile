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
		
                stage('Docker Build and Tag Tomcat Image') {
                        steps {
                                sh 'docker build -t account:latest .' 
                		//sh 'docker tag account nsihamlogwire/account:latest'
                		sh 'docker tag account sihamlogwire/account:$BUILD_NUMBER'
				
                         }
                }
	        stage('Docker Build and Tag Mode_Jk Image') {
                        steps {
                                sh 'docker build -t apache_JK:latest ./conf' 
                		//sh 'docker tag apache_JK nsihamlogwire/apache_JK:latest'
                		sh 'docker tag apache_JK sihamlogwire/apache_JK:$BUILD_NUMBER'
				
                         }
                }

              //  stage('Test Image') {
              //          steps {
              //                   sh 'docker run -tid -p  8082:8080 sihamlogwire/account:1.0'
                //         }
                //}


                 stage('Docker Push') {
                        steps {
                                withCredentials([usernamePassword(credentialsId:'dockerHub',passwordVariable: 'dockerHubPassword',usernameVariable: 'dockerHubUser')]) {
                                        sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                                        sh 'docker push sihamlogwire/account:$BUILD_NUMBER'
					sh 'docker push sihamlogwire/apache_JK:$BUILD_NUMBER'
                                 }
		
			}
		}
	}
}
