#Specify the Base Image
FROM centos:7

#Add a tag
LABEL maintainer="damien"

#Update our packages
RUN yum -y update
RUN yum -y clean all

#Install Apache
RUN yum install -y httpd

#Copy the app inside the container
COPY index.html /var/www/html
COPY error.html /var/www/html

#Port on which the container should listen on
EXPOSE 80

#Run httpd by doing "systemctl start httpd"
#When container starts please start Apache
ENTRYPOINT [ "/usr/sbin/httpd" ]

#We don't want the container to exit
#Run the container in the background
CMD [ "-D", "FOREGROUND" ]
