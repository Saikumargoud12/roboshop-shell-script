LOG_FILE=/tmp/mongodb
echo "setting up the mongodb repo file"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo>>/$LOG_FILE
echo status=$?
echo "installing mongodb server"
yum install -y mongodb-org>>$LOG_FILE
echo status=$?
echo "updating mongodb listen address"
sed -i -e 's/127.0.0.1/0.0.0.0' /etc/mongodb.conf
echo status=$?
echo "starting mongodb service"
systemctl enable mongod>>$LOG_FILE
systemctl start mongod>>$LOG_FILE
echo status=$?