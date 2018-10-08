FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/logstash-input-okta_system_log:develop

RUN bundle exec rspec
RUN gem build logstash-input-okta_system_log.gemspec

