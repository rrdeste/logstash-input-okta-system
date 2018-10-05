FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/kelsiemlogstash


RUN find / | egrep "\/bin\/gem$"
RUN asdasdasd
RUN yum install -y ruby
# RUN gem install bundler
# RUN find / | egrep "\/bundle.?$"
RUN mkdir -p /opt/okta_system_log
COPY /* /opt/okta_system_log/
WORKDIR /opt/okta_system_log
RUN ls -la /opt/okta_system_log
# RUN which bundle
# RUN bundle install
RUN /usr/share/logstash/vendor/bundle/jruby/2.3.0/bin/bundle install



# https://github.com/elastic/logstash/issues/5345
