#!/bin/bash
#
# This script fixes Docker (for me) on my Arch+ system(s). I've encountered
# _many_ problems with using Docker on Arch+ in the past, and this alleviates my woes.
# To our brave GitHub user borsyn, who, in the face of doubt, anxiety, and a broken Docker engine,
# not only sought to fix his woes but the community's, wrote this script as the synthesis
# between the thesis of a broken Docker engine and the antithesis of not knowing how to fix it.
#
# Everything below line 14 was written by github.com/borsyn and was posted to Issue #31546
# on github.com/moby/moby. I am hosting this solution here so I can leverage it in the future.
#
# This script is in the public domain
#
# Godspeed, brave soul.
#
# create docker0 bridge
# restart docker systemd service
# confirm new outgoing NAT masquerade is set up
#
# reference
#     https://docs.docker.com/engine/userguide/networking/default_network/build-bridges/
#

sudo brctl addbr docker0
sudo ip addr add 192.168.42.1/24 dev docker0
sudo ip link set dev docker0 up
ip addr show docker0
sudo systemctl restart docker
sudo iptables -t nat -L -n

# I lied, the line below was changed from exit(0)
exit 0
