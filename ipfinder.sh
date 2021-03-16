#!/bin/bash
# Helpful script for finding and formatting the hostname, image name, and IP addresses of running containers
for i in {0..$(($(docker ps -q | wc -l)-1))}; do docker inspect $(docker ps -q) | jq ".[$i] | {Hostname: .Config.Hostname, Image: .Config.Image,IpAddress: .NetworkSettings.IPAddress}"; done