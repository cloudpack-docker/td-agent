FROM cloudpack/centos

RUN yum -y update
RUN yum -y install sudo
RUN yum -y clean all

RUN sed -ri 's/Defaults    requiretty/#Defaults    requiretty/g' /etc/sudoers
RUN curl -s -L https://td-toolbelt.herokuapp.com/sh/install-redhat-td-agent2.sh | sh

CMD /usr/sbin/td-agent -o /var/log/td-agent/td-agent.log

VOLUME /var/log/td-agent
VOLUME /etc/td-agent
