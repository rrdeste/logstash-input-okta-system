FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/kelsiemlogstash

RUN find / | egrep "\/bundle$"
RUN find / | egrep "\/jruby$"

RUN mkdir -p /opt/okta_system_log
COPY / /opt/okta_system_log/*
WORKDIR /opt/okta_system_log
RUN /usr/share/logstash/vendor/bundle/jruby/2.3.0/gems/bundler-1.9.10/bin/bundle install