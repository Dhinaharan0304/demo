FROM maven:latest AS build
WORKDIR /home/ubuntu/project
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn clean package 
RUN ls -la /home/ubuntu/project/target
FROM tomcat:latest
COPY --from=build /home/ubuntu/project/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
