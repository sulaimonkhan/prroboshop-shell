echo -e "\e[33m Copy MongoDB Repo File \e[0m"
cp /home/centos/prroboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo

echo -e "\e33m Installing MongoDB Server \e[0m"
yum install mongodb-org -y

