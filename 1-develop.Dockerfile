FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/logstash-input-okta_system_log:base

RUN find / | egrep \/bin\/bundle$



RUN mkdir -p /opt/okta_system_log
RUN mkdir -p /opt/efs/plugins

COPY /* /opt/okta_system_log/
WORKDIR /opt/okta_system_log
RUN ls -la /opt/okta_system_log


RUN bundle install