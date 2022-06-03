#!/bin/bash
apt-get update
apt-get install prometheus -y
netstat -atunp | grep 9090