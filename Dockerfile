FROM debian 
VOLUME /unturned
RUN dpkg --add-architecture i386 \
&& apt -y update \
&& apt -y upgrade \
&& apt-get -y install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 \
&& apt-get -y install  libstdc++6 libgcc1 libcurl4-gnutls-dev \
&& apt -y install wget \
&& mkdir /steamcmd \
&& wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /steamcmd/steamcmd_linux.tar.gz \
&& tar -xzvf /steamcmd/steamcmd_linux.tar.gz -C /steamcmd \
&& /steamcmd/steamcmd.sh +force_install_dir /unturned +login anonymous +app_update 1110390 +quit 
WORKDIR /unturned
