LOG_FILE=/tmp/redis

echo "setup yum repos for redis"
 dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>$LOG_FILE
 status=$?
 echo "enabling yum repos"
dnf module enable redis:remi-6.2 -y &>>$LOG_FILE
status=$?

echo "install redis"
 yum install redis -y>>$LOG_FILE
 status=$?

 echo "updating the address from 127.0.0.1 to 0.0.0.0 "
 sed -i -e 's/127.0.0.1/0.0.0.0/'/etc/redis.conf /etc/redis/redis.conf
status=$?

echo "enabling redis"
 systemctl enable redis &>>$LOG_FILE
 status=$?

 echo "start redis"
  systemctl start redis &>>$LOG_FILE
  status=$?