echo -e "\e[33m Configurin Nodejs Repos \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m Install Nodejs \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m Add Application User \e[0m"
useraadd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m Create Application Directory \e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app

echo -e "\e[33m \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app 

echo -e "\e[33m  Extarct Application Content \e[0m"
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33mInstall Nodejs Dependencies \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33m Setup Systemd Service \e[0m"
cp /home/centos/prroboshop-shell/catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\e[33m Start Catalogue Service \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl restart catalogue &>>/tmp/roboshop.log

echo -e "\e[33m Copy MongoDB Repo File \e[0m"
cp /home/centos/prroboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log


echo -e "\e[33m Install MongoDB Client \e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m Load Schema \e[0m"
mongo --host mongodb-dev.devopsb72.site </app/schema/catalogue.js &>>/tmp/roboshop.log
