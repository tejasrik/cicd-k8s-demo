FROM openjdk:8
EXPOSE 8080
ADD target/*.war jenpipeline.war
ENTRYPOINT ["java","-jar","/jenpipeline.war"]
CMD while true; do echo 'Hit CTRL+C'; sleep 1; done
