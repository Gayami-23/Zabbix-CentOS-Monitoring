

**Zabbix Enterprise Monitoring Project-Jayamini's Part**
---



**Project Objective**



* To establish a secure, real-time monitoring link between a Zabbix Management Server (Ubuntu) and a remote Client Host (CentOS) while resolving common network and synchronization issues.



**Technical Implementation \& Troubleshooting**



1. Connection Establishment (The "Red Box" Fix)

          Issue: The Zabbix Dashboard showed a red ZBX availability icon, indicating the server could not reach the agent.

 	  Root Cause: The CentOS firewall was blocking inbound traffic on port 10050.

          Resolution: Gayami configured the firewall rules:  sudo firewall-cmd --permanent --add-port=10050/tcp

                                                             sudo firewall-cmd --reload

 	  Result: The ZBX icon turned Green.



2\. Time Synchronization (The "Orange Box" Fix)

         Issue: A warning appeared stating "System time is out of sync (diff > 60s)".

         Root Cause: The clock on the CentOS agent did not match the Ubuntu server, causing data timestamp errors.

         Resolution: We utilized the chrony daemon to force a manual synchronization:  sudo systemctl start chronyd

                                                                                       sudo chronyc -a makestep

         Result: The orange warning cleared, and status changed to RESOLVED.



3\. Performance Monitoring

        Metrics Captured:

               CPU Load: Monitored via system.cpu.load.

               Network Traffic: Real-time analysis of eth0 incoming/outgoing packets.

               Stress Testing: We validated the triggers by running the stress tool on the CentOS machine to visualize CPU spikes on my dashboard.



4\. Problem Identification

       When we first connected the CentOS agent, the dashboard flagged a Warning (Orange/Red status).

       The Problem: The system time on the agent was more than 60 seconds different from the server, which would cause errors in our data graphs.





5\. Environment Details

|Role|Operating System|IP Address|
|-|-|-|
|Zabbix Server|Ubuntu 22.04 LTS (Jayamini)|192.168.8.188|
|Zabbix Agent|CentOS 7/8 (Gayami)|192.168.8.103|





**Server Administration \& Security Hardening-Gayami's Part** 
---


🛠️ **Role Overview**

As the Server Administrator for this project, my primary responsibility was to deploy, secure, and configure the managed CentOS 10 Stream host. I ensured the server was reachable over a bridged network while maintaining a strict security posture through firewall orchestration.


🔐 **Security Hardening (Firewall Configuration)**

To protect the infrastructure, I implemented a "Least Privilege" firewall policy. This ensured that only the specific communication channels required for monitoring were accessible.

Protocol Access: Successfully opened Port 10050/TCP to allow the Zabbix Server to communicate with the local agent.

Persistence: Configured the rules as --permanent and reloaded the firewalld service to ensure security remains active after a reboot.

Verification: Confirmed the status using sudo firewall-cmd --list-all, ensuring the "public" zone only exposed necessary services.


📡 **Monitoring Protocol Deployment**

I established the data bridge between the host and the dashboard using two industrial-standard methods:

SNMP v2c Configuration: Modified the snmpd.conf file to set a standardized "public" community string. This allows universal hardware monitoring.

Zabbix Agent 7.0: Installed and optimized the Zabbix Agent to stream live telemetry (CPU, RAM, and Disk I/O) to the monitoring station.

Network Identity: Configured the host with a static-mapped IP of 192.168.8.103 for consistent tracking.


🧪 **Performance Validation (Stress Testing)**

To provide empirical proof that the system works, I conducted a Resource Exhaustion Simulation.

The Test: Used the stress utility to intentionally push the CPU and RAM to their limits.

The Result: The test ran for 121 seconds, successfully overwhelming the system resources.

Success Metric: This test provided the "V-Spike" data that Jaye's dashboard captured, proving our alerting logic works under heavy industrial load.


📁 **File Inventory**

My contribution includes the following technical assets:

firewall\_rules.sh: Automation script for security hardening.

snmpd\_snippet.conf: Verified SNMP configuration.

stress\_test\_proof.txt: Raw terminal log of the performance validation.

system\_status.log: Proof of active monitoring services (Zabbix Agent \& SNMPD).



