FROM centos:7
MAINTAINER kloek

RUN echo "Adding assets"
ADD assets /assets

RUN mkdir -p "/opt/oracle/app/product/11.2.0/dbhome_1/admin/orcl/pfile/"
RUN cp /assets/init.ora /opt/oracle/app/product/11.2.0/dbhome_1/admin/orcl/pfile/init.ora

RUN echo "Setting modifiers on assets"
RUN chmod -R 755 /assets

RUN echo "Starting setup.sh"
RUN /assets/setup.sh

RUN echo "Exposing ports"
EXPOSE 1521
EXPOSE 8080

RUN echo "Starting Entrypoint"
CMD ["/assets/entrypoint.sh"]
