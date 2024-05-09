# JDK kurlumu
FROM amazoncorretto:17

# Projemizdeki JAR dosyamızın, Docker içinde çalışacağı konumu
ARG JAR_FILE=target/*.jar

# JAR dosyasını root klasörüne bu isimle kopyala
COPY ${JAR_FILE} pipeline-example.jar

CMD apt-get update-y

# projenin calisacaği iç port
EXPOSE 8080

# Uygulamamızın çalışmasını sağlıyoruz.
ENTRYPOINT ["java",  "-jar", "/pipeline-example.jar"]