#!/bin/bash
# Network Security Hardening for Monitoring Project
# Configured by: Sathuta (Member 1)

sudo systemctl start firewalld
sudo firewall-cmd --add-port=10050/tcp --permanent
sudo firewall-cmd --reload
echo "Firewall status: Port 10050 is now open for Zabbix communication."

This file is the foundation of your server's security.

What it does: It automates the configuration of the CentOS native firewall (firewalld).

Technical Detail: You used the --permanent flag, which is critical in server administration. Without this, your security rules would vanish as soon as the server restarts.

The Logic: By specifically opening TCP Port 10050, you created a "Secure Tunnel" that allows the Zabbix Server (Jayamini) to request data from your machine while keeping every other "door" locked.