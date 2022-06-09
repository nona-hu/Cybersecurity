# Cybersecurity

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Cloud network diagram](https://github.com/nona-hu/Cybersecurity/blob/main/Diagrams/Cloud%20Security%20Network.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

- [Filebeat Configuration](https://github.com/nona-hu/Cybersecurity/blob/main/Ansible/filebeat-config.yml) 
- [Filebeat Playbook](https://github.com/nona-hu/Cybersecurity/blob/main/Ansible/filebeat-playbook.yml)
- [Ansible Configuration]()

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

[Docker PS](Diagrams/dockerps.png)
[dockerps.png](https://github.com/nona-hu/Cybersecurity/blob/main/Diagrams/dockerps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.2.0.4

We have installed the following Beats on these machines:

- Filebeat was installed on Web1 

These Beats allow us to collect the following information from each machine:

Different types of beats can be installed on servers to collect and send various information to ElasticSearch.

- Auditbeat - collects and audits data in relation to users and processes on the chosen system
- [Filebeat](Diagrams/SSH-login.png) - forwards and centralises log data. e.g. system logs, user logins etc.
- Functionbeat - collects and forwards data in a serverless network architecture
- Heartbeat - monitors systems for their uptime through probing
- Metricbeat - collects metric data from all systems including cpu usage, memory, file system etc.
- Packetbeat - monitors network traffic and protocols to gain a better understanding of how traffic is flowing in a system
- Winlogbeat - collects Windows event logs 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the [install-elk.yml](Diagrams/install-elk.png) file to /etc/ansible directory. Ensure the remote_user is the same username on your ELK VM. i have used azureuser. 
- Update the [hosts file](Diagrams/hosts.png) to include the destination IPs and attributes
- The ELK server runs on `port 5601`. Create an incoming rule to allow TCP traffic over port 5601 from your IP address. 
- Run the playbook, and verify that you can load the ELK stack server from your browser at http://[your.VM.IP]:5601/app/kibana. 
- If configured correctly, you should see this kibana [homepage](Diagrams/kibanahome.png)

### Installing Filebeat

Filebeat forwards and centrallises log data and is useful for monitoring system logs.

To install filebeat you must first SSH into the Jumpbox and launch the ansible container. Then follow the below steps:
- Copy the [Filebeat configuration file](https://github.com/nona-hu/Cybersecurity/blob/main/Ansible/filebeat-config.yml) using the `curl` command 
' `curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat >> /etc/ansible/filebeat-config.yml`
- Scroll to line [#1106](Diagrams/Filebeatconfig1.png) and [#1806](Diagrams/Filebeatconfig2) and replace the IP address with the IP of your ELK machine. 
- Make a new `files` directory in /etc/ansible directory and move the filebeat-config.yml file to this directory
- Create another ansible playbook called filebeat-playbook.yml in /etc/ansible directory with the [instructions](Diagrams/Instructions.png). The playbook should look like [this](https://github.com/nona-hu/Cybersecurity/blob/main/Ansible/filebeat-playbook.yml)
- Open the ansible-config.yml and ensure that the remote_user is uncommented and the user is the same user as your ELK VM. It should look like [this](Diagrams/ansible.png)
- Run `ansible-playbook filebeat-playbook.yml` on the command line to complete the installation
![installation.png](https://github.com/nona-hu/Cybersecurity/blob/main/Diagrams/installation.png)

Once the installtion is finalised, http://[your.VM.IP]:5601/app/kibana will automatically update with the new dashboard
[dashboard.png]()
- 
