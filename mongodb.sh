echo -e "\e[33m Copy MongoDB Repo File \e[0m"
cp /home/centos/prroboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log

echo -e "\e[33m Installing MongoDB Server \e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[33m update MongoDB Listen Address \e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

echo -e "\e[33m Start MongoDB Service \e[0m"
systemctl enable mongod  &>>/tmp/roboshop.log
systemctl restart mongod  &>>/tmp/roboshop.log