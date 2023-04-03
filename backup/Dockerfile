FROM ubuntu
MAINTAINER Himanshu Waghale
RUN apt update
#CMD ["echo", "Let's learn docker"]
ENTRYPOINT ["echo", "Let's learn docker"]
COPY index.html /tmp
ADD robot.txt /tmp 
WORKDIR /tmp 
VOLUME /app 
EXPOSE 80/tcp 
EXPOSE 80/udp

