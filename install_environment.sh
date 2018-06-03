#!/bin/bash
#-------------------------------------------------------------------------
#
# @FILESOURCE install_tairo.sh
# @AUTHOR Tairo Roberto Miguel de Assunção
# @DATE Sat 2 June, 15:43 - 2018
# @VERSION 1.0.0
#
# Este script monta o Ambiente de desenvolvimento em distribuições linux
# Baseadas em Debian
#-------------------------------------------------------------------------



echo "Instalando JAVA 8..."
add-apt-repository  -y ppa:webupd8team/java
apt-get -y update
apt-get -y install oracle-java8-installer

echo "Instalando SNAP..."
apt-get -y install snapd

echo "Instalando pacotes extras com flash e codecs mp4..."
apt-get -y install ubuntu-restricted-extras

echo "Instalando curl..."
apt-get -y install curl

echo "Instalando git..."
apt-get -y install git-core
apt-get -y install git-flow
apt-get -y update

echo "Instalando NodeJs..."
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get -y update
apt-get install -y nodejs
apt-get install -y build-essential

echo "Intalando Android Studio..."
wget -c https://dl.google.com/dl/android/studio/ide-zips/3.1.2.0/android-studio-ide-173.4720617-linux.zip
unzip android-studio-ide*
rm -rf android-studio-ide-173.4720617-linux.zip
mv android-studio* /opt/android-studio
chmod +x /opt/android-studio/bin/studio.sh
chmod -R 777 /opt/android-studio
apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

#Cria arquivo executavel#
touch /usr/bin/studio
chmod 755 /usr/bin/studio
echo "#!/bin/sh" >> /usr/bin/studio
echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/studio
echo "export STUDIO_HOME=/opt/android-studio" >> /usr/bin/studio
echo "\"\$STUDIO_HOME/bin/studio.sh\" %f" >> /usr/bin/studio
ln -s /usr/bin/studio /bin/studio

#Cria icone do desktop#
touch /usr/share/applications/studio.desktop
echo "[Desktop Entry]" >> /usr/share/applications/studio.desktop
echo "Encoding=UTF-8" >> /usr/share/applications/studio.desktop
echo "Name=Android Studio" >> /usr/share/applications/studio.desktop
echo "Comment=Android Studio IDE" >> /usr/share/applications/studio.desktop
echo "Exec=studio" >> /usr/share/applications/studio.desktop
echo "Icon=/opt/android-studio/bin/studio.png" >> /usr/share/applications/studio.desktop
echo "Terminal=false" >> /usr/share/applications/studio.desktop
echo "Type=Application" >> /usr/share/applications/studio.desktop
echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/studio.desktop
echo "StartupNotify=true" >> /usr/share/applications/studio.desktop
