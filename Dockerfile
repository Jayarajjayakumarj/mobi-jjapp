FROM oraclelinux:8.4
LABEL email=jj@linux.com
ENV deploy=add
RUN yum install httpd -y && mkdir /common /common/webaap1 /common/webaap2 /common/webaap3
COPY html-sample-app /common/webaap1/
COPY project-html-website /common/webaap2/
ADD project-website-template /common/webaap3/
COPY deploy.sh /common/
WORKDIR /common
RUN chmod +x deploy.sh 
ENTRYPOINT ["./deploy.sh"]

