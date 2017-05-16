FROM centos:latest

WORKDIR /tmp

RUN yum update -y && yum install -y wget && yum clean all
RUN wget -O splunkforwarder-6.6.0-1c4f3bbe1aea-linux-2.6-x86_64.rpm 'https://download.splunk.com/products/universalforwarder/releases/6.6.0/linux/splunkforwarder-6.6.0-1c4f3bbe1aea-linux-2.6-x86_64.rpm' && rpm -ihv splunkforwarder-6.6.0-1c4f3bbe1aea-linux-2.6-x86_64.rpm && rm splunkforwarder-6.6.0-1c4f3bbe1aea-linux-2.6-x86_64.rpm

RUN chgrp -R 0 /opt/splunkforwarder \
  && chmod -R g+rwX /opt/splunkforwarder

RUN mkdir /.splunk \
  && chgrp -R 0 /.splunk \
  && chmod -R g+rwX /.splunk

WORKDIR /opt/splunkforwarder/bin/

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

#RUN mkdir -p /tmp/splunk/
#RUN chmod a+rw /tmp/splunk
#ENV SPLUNK_SERVER=
#ENV SPLUNK_MONITOR_LOCN=/tmp

ENTRYPOINT ["/sbin/entrypoint.sh"]
