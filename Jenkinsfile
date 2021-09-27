pipeline{

    agent any

    stages{

        stage("Descargar codigo de la aplicacion"){
            steps{
                git "https://github.com/ddieza04/facturas-spring-rest.git"
            }
        }
        stage("Compilar y ejecutar el proyecto"){
            steps{
                script {
                    if(isUnix()){
                        sh "mvn clean package"
                    }else{
                        bat "mvn clean package"
                    }
                }
            }
        }
        stage("Creacion de imagen"){
            steps{
                script {
                    if(isUnix()){
                        sh "docker build -t ddiez/app-java ."
                    }else{
                        bat "docker build -t ddiez/app-java ."
                    }
                }
            }
        }
        stage("Ejecucion de contenedor"){
            steps{
                script {
                    if(isUnix()){
                        sh "docker run -d --name app-java -p 18080:8080 ddiez/app-java"
                    }else{
                        bat "docker run -d --name app-java -p 18080:8080 ddiez/app-java"
                    }
                }
            }
        }
        stage("Test del servicio"){
            steps{
               echo ("Probando el servicio")
            }
        }
        stage("Cerrar recursos"){
            steps{
                script {
                    if(isUnix()){
                        sh "docker stop app-java"
                        sh "docker container rm app-java"
                        sh "docker image rm ddiez/app-java"
                    }else{
                        bat "docker stop app-java"
                        bat "docker container rm app-java"
                        bat "docker image rm ddiez/app-java"
                    }
                }
               
            }
        }
    }
}
