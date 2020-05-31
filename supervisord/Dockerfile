FROM mysql:5.7
MAINTAINER Eldhose P Wilson
RUN apt-get update && \
    apt-get install cron supervisor rsyslog rsyslog-doc procps -y
RUN mkdir /script && \
    mkdir /databasebackup
COPY scripts/mysqlbackup.sh /script
COPY scripts/log.sh /script
ADD conf/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
RUN mkdir -p /var/log/mysql \
	 && chown -R mysql: /var/log/mysql
ADD conf/crontab /var/spool/cron/crontabs/root
RUN chmod 0600 /var/spool/cron/crontabs/root \
        && chown root:crontab /var/spool/cron/crontabs/root
ADD conf/supervisord.conf /etc/supervisor/supervisord.conf
COPY conf/rsyslog.conf /etc/rsyslog.conf 
COPY conf/rsyslog/Array-graylog.conf /etc/rsyslog.d/Array-graylog.conf
ADD supervisor /etc/supervisor/conf.d
ADD scripts /home/scripts
RUN chmod +x /home/scripts/*.sh
VOLUME /home/log
VOLUME /home/cache
VOLUME /home/data
VOLUME /home/keys
VOLUME /home/mysql

ADD conf/logrotate/* /etc/logrotate.d/ 
RUN chmod 644 /etc/logrotate.d/*

RUN update-rc.d supervisor remove && \
    update-rc.d mysql remove && \
    update-rc.d cron remove
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]

