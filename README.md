
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Apache Spark Out of Memory Error incident.
---

Apache Spark Out of Memory Error is a type of incident that occurs when the Apache Spark application running on a system is unable to allocate enough memory to perform its tasks. This can happen when the system's memory is insufficient or when there is a memory leak in the application's code. When this incident occurs, the application may crash, become unresponsive, or produce incorrect results. It is important to diagnose and resolve this issue as soon as possible to ensure the smooth functioning of the application.

### Parameters
```shell
export PATH_TO_SPARK_LOGS="PLACEHOLDER"

export PATH_TO_SPARK_CONFIGURATION_FILE="PLACEHOLDER"

export PID_OF_JAVA_PROCESS="PLACEHOLDER"

export NEW_MEMORY_LIMIT="PLACEHOLDER"
```

## Debug

### Check available memory
```shell
free -m
```

### Check system logs for any relevant error messages
```shell
dmesg | grep -i error
```

### Check Spark logs for any relevant error messages
```shell
grep -i error ${PATH_TO_SPARK_LOGS}
```

### Check Spark configuration settings
```shell
cat ${PATH_TO_SPARK_CONFIGURATION_FILE}
```

### Check for any running processes that may be consuming memory
```shell
ps aux --sort=-%mem | head
```

### Check for any Java processes that may be consuming memory
```shell
jmap -heap ${PID_OF_JAVA_PROCESS}
```

### Check for any other system or application processes that may be consuming memory
```shell
top
```

## Repair

### Increase the memory capacity of the server in use.
```shell


#!/bin/bash



# Set the new memory limit

NEW_MEMORY_LIMIT=${NEW_MEMORY_LIMIT}



# Edit the configuration file to set the new memory limit

sed -i "s|^-Xmx.*| -Xmx${NEW_MEMORY_LIMIT}m|" /etc/systemd/system.conf



# Restart the systemd daemon to apply the changes

systemctl daemon-reload



# Restart the server to apply the new memory limit

reboot





sudo ./increase_memory.sh


```