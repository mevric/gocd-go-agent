FROM ubuntu:16.04
MAINTAINER mevric <https://github.com/mevric>

## install java and GO-Agent.
COPY material/jdk-8u112-linux-x64.tar.gz /opt/jdk-8u112-linux-x64.tar.gz
COPY material/go-agent-16.11.0-4185.zip /opt/go-agent-16.11.0-4185.zip

RUN apt-get update \
 && apt-get install -y supervisor tar git \
 && apt-get install -y net-tools \
 && apt-get install -y unzip zip \
 && mkdir -p /var/log/supervisord/ \
 && chmod -R 755 /usr/lib/python2.7 \
 && cd /opt && echo 'de9b7a90f0f5a13cfcaa3b01451d0337 jdk-8u112-linux-x64.tar.gz' > jdk-8u112-linux-x64.tar.gz.md5 \
	&& md5sum -c jdk-8u112-linux-x64.tar.gz.md5 \
	&& tar -xzf jdk-8u112-linux-x64.tar.gz \
	&& update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_112/bin/java 1 \
	&& rm /opt/jdk-8u112-linux-x64.tar.gz \
	&& java -version \
	&& cd /opt \
	&& unzip /opt/go-agent-16.11.0-4185.zip \
	&& rm /opt/go-agent-16.11.0-4185.zip \	
	&& ls -l /opt/

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /opt/jdk1.8.0_112

####### Add svn client and Make command ############
RUN apt-get install -y subversion build-essential \
	&& svn --version \
	&& make --version

####### Add supervisord ############
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

####### start the services ############
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# run to verify. 
RUN ls -l /var/log
RUN ls -l /var/log/supervisord
RUN ls -l /var/log/supervisor

EXPOSE 8154