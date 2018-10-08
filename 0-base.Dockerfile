FROM jruby

RUN find / | egrep \/bin\/bundle$



RUN mkdir -p /opt/okta_system_log
COPY /* /opt/okta_system_log/
WORKDIR /opt/okta_system_log
RUN ls -la /opt/okta_system_log


RUN bundle install

RUN apt-get update && apt-get install -y nfs-common
RUN mkdir -p /opt/efs/plugins
RUN mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-59c12760.efs.ap-southeast-2.amazonaws.com:/plugins /opt/efs/plugins