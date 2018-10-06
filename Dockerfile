FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/kelsiemlogstash

### The following does not work
# FROM 383707766587.dkr.ecr.ap-southeast-2.amazonaws.com/kelsiem.com/kelsiemlinux

### TODO: Maybe we don't need a Logstash image above since bundle install appears to be doing something to install Logstash (not sure if it's the full Logstash or just the JRuby dependecies, not sure what is the minimum requirement), perhaps just start with normal Amazon Linux image


# Install JRuby on Amazon Linux
RUN \
    # Install prerequisites
    yum install -y gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel ruby-devel gcc-c++ jq git && \
    # Import key
    curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - && \
    # Install RVM
    curl -sSL https://get.rvm.io | bash -s stable --ruby

SHELL [ "/bin/bash", "-l", "-c" ]

RUN \
    source /usr/local/rvm/scripts/rvm && \
    # Install jruby
    rvm install "jruby-9.2.0.0-v" && \
    # Confirm
    jruby -v
RUN rvm "jruby -v"

RUN find / | egrep \/jruby$
RUN ln -s /usr/local/rvm/rubies/jruby-9.2.0.0-v/bin/jruby /usr/bin/jruby
RUN jruby -v


RUN mkdir -p /opt/okta_system_log
COPY /* /opt/okta_system_log/
WORKDIR /opt/okta_system_log
RUN ls -la /opt/okta_system_log

SHELL [ "/bin/bash", "-l", "-c" ]
RUN source /usr/local/rvm/scripts/rvm && ( bundle install || echo ERROR)

