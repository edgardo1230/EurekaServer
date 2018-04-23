 docker build --file=Dockerfile  --tag=focalpoint/eureka-server:latest --rm=true .
 docker stop eurekaServer
 docker rm eurekaServer
 docker run  -d  -p 1111:1111 --name eurekaServer focalpoint/eureka-server:latest
