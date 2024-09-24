from maven:3.8.4-openjdk-18 AS build
WORKDIR /home/ubuntu/project
copy ./pom.xml ./pom.xml
copy ./src ./src
RUN mvn clean package 
from tomcat:9.0.65-jdk18
copy --from=build /home/ubuntu/project/target/*.war /usr/local/tomcat/webapps/
expose 8080
CMD ["catalina.sh", "run"]
