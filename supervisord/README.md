# mysql-kuberentes
Mysql deployment for kubernetes

#Build Image
```
Build dockerimage from the provided dockerfile.
```

Supervisord for mysql service:

Insalled supervisor in a Docker mysql:5.7 image and enalbed the process with supervisord.

Daemon supervisor tool will check that the process is running and at all times and starts
it in case is down. The comments will explain the usage:
```
[program:mysqld]
user=mysql
#command=/usr/sbin/mysqld
command=/entrypoint.sh mysqld
startsecs = 1 //Seconds to wait between attempts to restart service
autostart=true
startretries=3 //number of retrying times (attempts) if process is die
stopwaitsecs=10 //waiting xx second before before stop
stdout_logfile  = /home/log/%(program_name)s.log
stderr_logfile  = /home/log/%(program_name)s.log
redirect_stderr = true
events=PROCESS_STATE //event listner
```
