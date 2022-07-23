clear

if [ ! -d "bot" ]; then
	mkdir bot
fi

cd bot

if [ -e "dadosBot.ini" ] ; then

	screen -X -S bot quit > /dev/null
	screen -dmS bot php bot.php
	echo "Bot foi reiniciado e está executano em segundo plano"

else

echo "INSTALANDO MOMENTO PERRO..."

#add-apt-repository ppa:ondrej/php > /dev/null 2>&1

apt-get update > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1
apt-get install php -y > /dev/null 2>&1
apt-get install php-redis -y > /dev/null 2>&1
apt-get install php-curl -y > /dev/null 2>&1
apt-get install php5 -y > /dev/null 2>&1
apt-get install php5-redis -y > /dev/null 2>&1
apt-get install php5-curl -y > /dev/null 2>&1
apt-get install redis-server -y > /dev/null 2>&1
apt-get install redis -y > /dev/null 2>&1
apt-get install screen -y > /dev/null 2>&1
apt-get install zip -y > /dev/null 2>&1

wget https://raw.githubusercontent.com/Gatesccn/repodeccs/main/gerarusuario-sshplus.sh -O gerarusuario.sh; chmod +x gerarusuario.sh > /dev/null

wget https://github.com/Gatesccn/repodeccs/raw/main/admysshbot.zip -O bot.zip && unzip bot.zip > /dev/null

rm dadosBot.ini > /dev/null

clear

ip=$(wget -qO- ipv4.icanhazip.com/)

echo "AGREGE EL TOKEN DEL BOT:"
read token
clear
echo "ip=$ip
token=$token
limite=100" >> dadosBot.ini

screen -dmS bot php bot.php

rm bot.zip

echo "BOT EJECUTANDOSE EN SEGUNDO PLANO
AGRADECIMIENDOS a @GATESCCN"

fi
