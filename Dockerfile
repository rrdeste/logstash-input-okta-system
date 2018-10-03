FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/kelsiemlogstash

RUN find / | egrep "\/bundle$"
RUN bundle install