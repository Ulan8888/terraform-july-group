#!/bin/bash

sudo apt update
sudo apt install ca-certificates curl openssh-server tzdata perl -y
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
sudo bash script.deb.sh
sudo apt install gitlab-ce -y


####   this is our gitlab file, user = root    sudo nano /etc/gitlab/initial_root_password  