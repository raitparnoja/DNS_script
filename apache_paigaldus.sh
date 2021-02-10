#!/bin/bash
#apache kontroll ja paigaldus
#Kõigepealt kontrollin, kas on paigaldatud.

APACHE=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
# Kui ei ole, siis installime
if [ $APACHE -eq 0 ]; then
	echo "Apache2 install"
	apt install apache2
elif [ $APACHE -eq 1 ];then
	echo "Apache2 on paigaldatud"
	# Vaatame staatust
	service apache2 start
	service apache2 status
fi

sed -i "s/Apache2 Debian Default Page/ Hau. Oled Raidi Apaches/g" /var/www/html/index.html

