#!/usr/bin/env bash

DEV_USER_NAME="user"

adduser --disabled-password --gecos "" ${DEV_USER_NAME}
adduser ${DEV_USER_NAME} sudo
echo '%sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers.d/my_sudoer
chmod 0440 /etc/sudoers.d/my_sudoer
