FROM ubuntu:16.04
MAINTAINER "keisuke Yammaoto<keisuke@butterjam.cc>"

# Essential packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential autoconf bison \
  libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
  libncurses5-dev libffi-dev libgdbm-dev
RUN apt-get install -y openssh-server
RUN apt-get install -y sudo tzdata vim less git

# For general development
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN apt-get install -y libmysqld-dev mysql-client

# Timezone
ENV TZ='/usr/share/zoneinfo/Asia/Tokyo'
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata

# SSHD setup
RUN mkdir /var/run/sshd
RUN sed -i 's/^#PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Create user
ADD ./include/create_user.sh /create_user.sh
RUN chmod 0755 /create_user.sh
RUN /create_user.sh
ADD ./include/rbenv_setup.sh /home/user/rbenv_setup.sh
RUN chown user /home/user/rbenv_setup.sh
RUN chmod 0700 /home/user/rbenv_setup.sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
