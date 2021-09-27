# La ejecución del codigo se hace fuera y solo copiamos en proyecto compilado en el direcotrio
FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY target/*jar app.jar

ENTRYPOINT [ "java", "-jar", "app.jar" ]