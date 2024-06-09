#!/bin/bash
# this is run by cron every 3 hours
# 0 */3 * * * /home/dereck/fix_permissions.sh
# this fixes the error: Network Error (s1001)
sudo chown -R dereck:dereck /media/nvme0/
sudo chmod -R 777 /media/nvme0/
# sudo chmod -R 775 /media/nvme0/
