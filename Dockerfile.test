FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/logstash-input-okta_system_log:develop

RUN bundle exec rspec
RUN gem build logstash-input-okta_system_log.gemspec

VOLUME [ "/opt/efs/plugins" ]

RUN \cp logstash-input-okta_system_log-0.1.0.gem /opt/efs/plugins/logstash-input-okta_system_log-0.1.0-test.gem