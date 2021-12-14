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
                 stage('Tests') {
                         steps {
                                 sh 'mvn test'
                }
                         post {
                                 always {
                                         junit 'target/surefire-reports/*.xml'
                         }

                                 success {
                                         stash(name: 'artifact', includes: 'target/*.war')
                                         stash(name: 'pom', includes: 'pom.xml')
                                         // to add artifacts in jenkins pipeline tab (UI)
                                         archiveArtifacts 'target/*.war'
                                 }
                          }
                }
		

	}
}
