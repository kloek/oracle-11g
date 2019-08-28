FROM centos:7
MAINTAINER kloek


ADD assets /assets

#USER root
#RUN mkdir -p "/opt/oracle/app/product/11.2.0/dbhome_1/admin/orcl/pfile/"
#RUN cp /assets/init.ora /opt/oracle/app/product/11.2.0/dbhome_1/admin/orcl/pfile/init.ora

RUN chmod -R 755 /assets

RUN /assets/setup.sh

EXPOSE 1521
EXPOSE 8080

CMD ["/assets/entrypoint.sh"]
