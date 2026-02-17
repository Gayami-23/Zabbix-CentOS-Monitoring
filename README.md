#### Zabbix Enterprise Monitoring Infrastructure

##### 📋 Project Overview

A comprehensive enterprise monitoring solution implementing real-time telemetry, security hardening, and performance validation across hybrid Linux environments. This project demonstrates practical expertise in infrastructure monitoring, network security, and system administration.



##### 🎯 Technical Objectives

Establish secure, real-time monitoring between Zabbix Server (Ubuntu 22.04 LTS) and Client Host (CentOS Stream 10)



Implement firewall hardening with least-privilege principles



Configure multi-protocol monitoring (Zabbix Agent 7.0 \& SNMP v2c)



Validate monitoring efficacy through stress testing



Resolve time synchronization and connectivity challenges

##### 

##### 🏗️ Architecture

Environment Specifications

Role	Operating System	IP Address	Services

Zabbix Server	Ubuntu 22.04 LTS	192.168.8.188	Zabbix Server 7.0, MySQL, Apache

Zabbix Agent	CentOS Stream 10	192.168.8.103	Zabbix Agent 7.0, SNMPd, Chronyd

##### 🔧 Technical Implementation

Phase 1: Connectivity Resolution ("The Red Box Fix")

Challenge: Zabbix dashboard displayed red ZBX availability indicator



Root Cause: CentOS firewall blocking inbound Zabbix Agent port (10050/TCP)



Resolution:



bash

sudo firewall-cmd --permanent --add-port=10050/tcp

sudo firewall-cmd --reload

sudo firewall-cmd --list-all  # Verification

Outcome: Successful server-agent communication established



Phase 2: Time Synchronization ("The Orange Box Fix")

Challenge: System time drift warning (>60s discrepancy)



Root Cause: Clock misalignment between Ubuntu server and CentOS agent



Resolution:



bash

sudo systemctl start chronyd

sudo chronyc -a makestep

sudo chronyc tracking  # Verification

Outcome: Timestamp accuracy restored; warning status resolved



Phase 3: Security Hardening \& Monitoring Deployment

Firewall Orchestration (Least Privilege Model)

Implemented strict access control with permanent rules



Verified zone configurations and service exposure



Automation Script: firewall\_rules.sh



Monitoring Protocol Configuration

Zabbix Agent 7.0



Configured for real-time telemetry streaming



Metrics: CPU load, memory utilization, disk I/O, network traffic



SNMP v2c Implementation



Configured community string for universal hardware monitoring



Verified through snmpd\_snippet.conf



Phase 4: Performance Validation \& Stress Testing

Resource Exhaustion Simulation

Tool: stress utility on CentOS agent



Duration: 121 seconds of sustained CPU/RAM load



Result: Successfully triggered monitoring alerts



Evidence: stress\_test\_proof.txt



Visualization: Dashboard captured CPU "V-Spike" patterns



Monitored Metrics

system.cpu.load - CPU utilization tracking



eth0 traffic analysis - Real-time packet monitoring



System time accuracy - Continuous validation



##### 📊 Problem Resolution Summary

Issue	Detection Method	Resolution	Status

Firewall blocking port 10050	Red ZBX icon	Firewall-cmd rules	✅ RESOLVED

Time synchronization >60s	Orange warning	Chronyd forced sync	✅ RESOLVED

CPU spike validation	Stress test	Alert trigger confirmed	✅ VALIDATED

##### 🛡️ Security Hardening Measures

Firewall Configuration



Least-privilege access policy



Permanent rule implementation



Zone-based security enforcement



Service Hardening



SNMP community string standardization



Zabbix agent secure configuration



Service status verification: system\_status.log

##### 

##### 📁 Project Assets

Configuration Files

firewall\_rules.sh - Automated security hardening script



snmpd\_snippet.conf - Validated SNMP configuration



stress\_test\_proof.txt - Performance validation evidence



system\_status.log - Active services verification



##### 👥 Contributors

Jayamini Dissanayake- Zabbix Server Administrator



www.linkedin.com/in/jayamini-dissanayake-6806812b6



Zabbix Server deployment \& configuration



Dashboard implementation \& visualization



Time synchronization troubleshooting



Performance monitoring \& metric analysis



Gayami Jayawardane - Security \& Systems Administrator


www.linkedin.com/in/gayami-jayawardane-b3b63935b



CentOS host configuration \& hardening



Firewall orchestration \& security implementation



Zabbix Agent \& SNMP protocol deployment



Stress testing \& performance validation



##### 🚀 Key Achievements

Successfully established secure monitoring bridge across heterogeneous Linux environments



Implemented enterprise-grade security hardening with least-privilege model



Validated monitoring efficacy through controlled stress testing



Achieved 100% resolution of connectivity and synchronization issues



Created reusable automation scripts for firewall configuration



##### 📈 Future Enhancements

Implement automated alerting via email/SMS



Deploy Grafana for advanced visualization



Expand monitoring to containerized environments



Integrate with centralized logging solution (ELK stack)



##### 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

