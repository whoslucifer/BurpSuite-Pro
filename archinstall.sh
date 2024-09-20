#!/bin/bash

# Installing Dependencies
   echo 'Installing Dependencies'
   sudo apt update ; sudo apt install curl git wget openjdk-17-jdk openjdk-17-jre openjdk-23-jdk openjdk-23-jre -y

# Cloning
   echo 'Cloning Xiv3r Burpsuite Professional'
   cd ~/Sws
   git clone https://github.com/xiv3r/Burpsuite-Professional.git     
   cd Burpsuite-Professional
 
# Download Burpsuite Professional Latest.
    echo 'Downloading Burpsuite Professional Latest...'
    mkdir -p /usr/share/burpsuitepro
    cp -r ~/Sws/Burpsuite-Professional/loader.jar /usr/share/burpsuitepro
    cd /usr/share/burpsuitepro
    
    set html (curl -s https://portswigger.net/burp/releases)

    set burp_version (echo $html | grep -Po '(?<=/burp/releases/professional-community-)[0-9]+\-[
0-9]+\-[0-9]+' | head -n 1)

    set Link "https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar&version=&"

    echo $version

    sudo wget "$Link" -O burpsuite_pro_v$version.jar --quiet --show-progress


# Execute Key Generator.
    echo 'Starting Key Generator'
    java -jar ~/Sws/Burpsuite-Professional/loader.jar &
    sleep 2

# Execute Burp Suite Professional
    echo 'Executing Burpsuite Professional with Key Generator'

    echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=A
LL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/j
dk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm
.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar
 &" | sudo tee burpsuitepro > /dev/null



    sudo chmod +x burpsuitepro
    sudo cp burpsuitepro /bin/burpsuitepro
    ./burpsuitepro