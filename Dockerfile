FROM jruby

RUN find / | egrep \/bin\/bundle$



RUN mkdir -p /opt/okta_system_log
COPY /* /opt/okta_system_log/
WORKDIR /opt/okta_system_log
RUN ls -la /opt/okta_system_log


RUN bundle install
RUN bundle exec rspec
RUN gem build logstash-input-okta_system_log.gemspec