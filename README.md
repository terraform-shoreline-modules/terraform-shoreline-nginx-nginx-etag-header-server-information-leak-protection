
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# ETag Header Server Information Leak Protection for Nginx Server.
---

This incident type involves protecting an Nginx server from Server Information Leak through the use of ETag header. This is done to prevent sensitive server information from being disclosed to unauthorized parties. The ETag header allows for the identification of resources that have changed. By protecting the ETag header, the server can prevent attackers from gaining access to sensitive information that could potentially be used to compromise the server or its resources.

### Parameters
```shell
export NGINX_ACCESS_LOG_FILE="PLACEHOLDER"

export NGINX_ERROR_LOG_FILE="PLACEHOLDER"

export NGINX_SERVER_URL="PLACEHOLDER"

export NGINX_CONFIG_FILE="PLACEHOLDER"
```

## Debug

### Check if the Nginx server is running.
```shell
systemctl status nginx
```

### Check the Nginx configuration file for the Etag header.
```shell
cat ${NGINX_CONFIG_FILE} | grep etag
```

### Check the Nginx access logs for signs of Etag header leaks.
```shell
cat ${NGINX_ACCESS_LOG_FILE} | grep -i etag
```

### Check the Nginx error logs for any related errors.
```shell
cat ${NGINX_ERROR_LOG_FILE} | grep -i etag
```

### Use curl to check if the server is leaking Etag header information.
```shell
curl -I ${NGINX_SERVER_URL}
```

## Repair

### Disable ETag header in the Nginx server configuration file to prevent its disclosure.
```shell
bash

#!/bin/bash



# Stop the Nginx service

sudo systemctl stop nginx.service



# Edit the Nginx configuration file to disable the ETag header

sudo sed -i 's/etag on;/etag off;/g' ${NGINX_CONFIG_FILE}



# Start the Nginx service

sudo systemctl start nginx.service


```