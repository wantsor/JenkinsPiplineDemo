FROM java:8
# git
ADD ./ /app/
WORKDIR /app
EXPOSE 9090
CMD java -jar pipeline-0.0.1-SNAPSHOT.jar