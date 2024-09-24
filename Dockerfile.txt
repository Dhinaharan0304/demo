from maven:3.8.4-openjdk-18 As build
workdir /home/ubuntu/project
copy ./pom.xml ./pom.xml
copy ./src ./src
run maven clean package 
from tomcat:9.0.65-jdk18
copy --from=build /home/ubuntu/project/*.war /usr/local/tomacwebapps/
expose 8080
cmd["catalina.sh", "run"]