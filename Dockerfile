FROM registry.access.redhat.com/rhscl/httpd-24-rhel7
LABEL Component="httpd" \
      Name="httpd-parent"
LABEL io.k8s.descriptions="A basic appache" \
      io.k8s.display-name="Apache parent image" \
      io.openshift.expose-services="80:http" \
      io.openshift.tags="apache, httpd"
ENV DOCROOT=/var/www/html \
    LANG=en_US \
    LOG_PATH=/var/log/httpd
    
RUN yum install -y --setopt=tsflags=nodocs --noplugins httpd && \
    yum clean all --noplugins -y && \
    echo "hello from parent " > ${HOME}/index.html
    
ONBUILD COPY src/${DOCROOT}/ 

EXPOSE 80

USER root

CMD /usr/sbin/apachectl - DFOREGROUND
    

      
