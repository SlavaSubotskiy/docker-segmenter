# Recoder instance based on latest debian

FROM debian

MAINTAINER anandasattva@gmail.com

RUN LIST="/etc/apt/sources.list" && \
DEB="deb http://www.deb-multimedia.org wheezy main non-free" && \
DEB_SRC="deb-src http://www.deb-multimedia.org wheezy main non-free" && \
echo "$DEB" >> $LIST && \
echo "$DEB_SRC" >> $LIST && \
apt-get update && \
apt-get -y --force-yes install deb-multimedia-keyring && \
apt-get update && \
apt-get install -y \
    libfaac-dev \
    libmp3lame-dev \
    libx264-dev \
    libzvbi-dev \
    wget && \
wget https://github.com/SlavaSubotskiy/docker-recoder/raw/master/ffmpeg-x264-faac-mp3-zvbi_1-1_amd64.deb -O /tmp/ffmpeg.deb && \
dpkg -i /tmp/ffmpeg.deb && \
apt-get remove -y wget && \
apt-get -y autoremove && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
rm -f /tmp/ffmpeg.deb

#ENTRYPOINT udpxy -a ${LISTEN_IP:-0.0.0.0} -p ${LISTEN_PORT:-8080} -c ${MAX_CLIENTS:-10} -T -m ${MCAST_IFACE:-eth1}
