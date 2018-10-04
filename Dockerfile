FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/kelsiemlogstash

RUN yum install -y ruby
RUN gem install bundler

RUN mkdir -p /opt/okta_system_log
COPY /* /opt/okta_system_log/
WORKDIR /opt/okta_system_log
RUN ls -la /opt/okta_system_log
RUN bundle install



# https://github.com/elastic/logstash/issues/5345
