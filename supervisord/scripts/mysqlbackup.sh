mysql -e 'show databases' -uroot -p$MYSQL_ROOT_PASSWORD > /script/mysqldbs.txt
T=$(date +%Y%m%d-%H%M%S)
for i in `grep -wv Database /script/mysqldbs.txt | grep -v '\.' | grep -v information_schema| grep -v performance_schema`; do mysqldump -u root -p$MYSQL_ROOT_PASSWORD $i > $i.sql | mv *.sql /databasebackup ; done
cd /databasebackup
tar -czf $T.tar.gz *.sql 
find /databasebackup -type f -mtime +7 -exec rm -fvRd {} \; 
