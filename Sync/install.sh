#!/usr/bin/env bash
apt-get -y install python-dev python-pip libnotify-cil-dev
python -m pip install notify2


chmod +x cronjob.py

mkdir ~/.rsync_backup/
mkdir ~/.rsync_backup/cron

cp cronjob.py ~/.rsync_backup/
cp cronjob.py ~/.rsync_backup/cron

cp USB.py ~/.rsync_backup/
cp USB.py ~/.rsync_backup/cron

touch ~/.rsync_backup/.installdirectory
touch ~/.rsync_backup/log.log
touch ~/.rsync_backup/cron/log.log

chown -R $USER ~/.rsync_backup
chmod -R 0777 ~/.rsync_backup

python ~/.rsync_backup/cronjob.py

echo "For which user"
read USER

echo "To setup autosync"
echo "run the following"
echo ""
echo "su -c \"echo \"0 * * * * export DISPLAY=:0.0 && export XAUTHORITY=/home/$USER/.Xauthority && sudo -u $USER /usr/bin/python /home/$USER/.rsync_backup/cron/cronjob.py > /dev/null\" >> /var/spool/cron/crontabs/$USER\ && exit\""


