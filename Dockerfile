FROM maven:3.8.4-openjdk-18-slim AS build
WORKDIR /home/ubuntu/project
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean package 
FROM tomcat:9.0.65-jdk18
COPY --from=build /home/ubuntu/project/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
