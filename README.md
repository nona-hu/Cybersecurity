# Cybersecurity

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Cloud network diagram](https://github.com/nona-hu/Cybersecurity/blob/main/Diagrams/Cloud%20Security%20Network.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

[Filebeat Configuration](https://github.com/nona-hu/Cybersecurity/blob/main/Ansible/filebeat-config.yml) 
[Filebeat Playbook](https://github.com/nona-hu/Cybersecurity/blob/main/Ansible/filebeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly availabe, in addition to restricting access to the network.
A load balancer sits on top of serverrs and reroutes client requests across all servers. It does this to improve efficiency and maximise speed of those requests to ensure one server is not overloaded.
A jumpbox is highly advantages when used as any tools deployed on the system can be maintained on that machine. This greatly improves efficiency as any updates required need only be deployed on a single system. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logfiles and system resources.
Filebeat is used primarily to forward and centralise log data. After the data is collected, it forwards the events to Elasticsearch or Logstash.


The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.5   | Ubuntu Linux     |
| Web 1    | Webserver| 10.0.0.6   | Ubuntu Linux     |
| ELK      | ElasticSearch | 10.2.0.4   | Ubuntu Linux     |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Any with SSH key 

Machines within the network can only be accessed by the Jumpbox.
Jumpbox
- Public IP: 20.213.109.184
- Private IP: 10.0.0.5

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | SSH Port 22/ YES    | Any with SSH key     |
|  ELK     | Kibana Port 5601/ YES| 10.2.0.4            |
| HTTPS    | HTTP Port 443/ YES  | Any                  |
| HTTP     | HTTP Port 80/ YES   | Any                  | 

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because doing so reduces the risk of configuration errors


The playbook implements the following tasks:
- Install Docker: Installs docker to remote server
- Install Python3_pip: Pip facilitates the installtion of other modules
- Docker Module: Asks Pip to install the docker modules
- Increase Memory: Requests the server to use more memory when using the Docker image
- Download and launch ELK container: Downloads ELK container with the public ports


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.2.0.4

We have installed the following Beats on these machines:

- Filebeat was installed on Web1 

These Beats allow us to collect the following information from each machine:

Different types of beats can be installed on servers to collect and send various information to ElasticSearch.

- #Auditbeat - collects and audits data in relation to users and processes on the chosen system
- #Filebeat - forwards and centralises log data. e.g. system logs, user logins etc.
- #Functionbeat - collects and forwards data in a serverless network architecture
- #Heartbeat - 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
