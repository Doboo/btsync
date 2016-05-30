#sudo wget http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable -O /tmp/btsync_x64.tar.gz

function set32 {
wget https://download-cdn.getsync.com/stable/linux-i386/BitTorrent-Sync_i386.tar.gz -O /tmp/btsync_i386.tar.gz
cd /opt/btsync
tar xzf /tmp/btsync_i386.tar.gz
}
function set64 {
wget https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz -O /tmp/btsync_x64.tar.gz
cd /opt/btsync
tar xzf /tmp/btsync_x64.tar.gz

}

mkdir /opt/btsync
mkdir /opt/btsync_transfer
if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ] ; then

    set64

else

    set32

fi
cp -a /root/btsync/btsync  /etc/init.d/btsync
chmod +x /etc/init.d/btsync
cp -a /root/btsync/btsync.cfg  /opt/btsync/btsync.cfg


#Æô¶¯
/etc/init.d/btsync start