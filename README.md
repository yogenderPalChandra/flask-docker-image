# How to run this docker image locally:

### build the image
docker build -t yogender027/flask-app:0.0.3 .

### run the image as container
docker run -d --name flask -p 8080:5000 yogender027/flask-app:0.0.3

### check the logs of container:
docker logs flask

### push to docker registery
docker push yogender027/flask-app:0.0.3

#### some miscellaneous commands:
docker ps -a  #check all containers
docker stop flask #stop container if faulty
docker rm <ID whcih comes from docker ps -a> #remove container
docker rmi <image ID, comes from docker images>
