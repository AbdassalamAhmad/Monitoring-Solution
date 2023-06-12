# Monitoring Solution
Monitoring Solution is out-of-the-box program to monitor your Containers and your python app latency and number of requests.

## Project Demo
#### Python App Dashboard
![Python_App_Monitoring](https://github.com/AbdassalamAhmad/Monitoring-Solution/assets/83673888/8b8b51ce-b56c-423d-9ec2-156b0d3e8f61)

#### cAdvisor Dashboard
![cadvisor_monitoring](https://github.com/AbdassalamAhmad/Monitoring-Solution/assets/83673888/d478bd16-bd35-4db5-84d8-165625973342)

#### Node Exporter Dashboard
![Node_Exporter_Monitoring](https://github.com/AbdassalamAhmad/Monitoring-Solution/assets/83673888/9c78b635-d46c-49d0-9ec8-d20b8bb2895a)

## Project Details
- I've used Docker-Compose to build this project, which contains 6 containers.
  - Python-App: simple Flask app to output some metric to be collected by prometheus.
  - Prometheus: to scrape and collect metrics data from the targets (the rest of the containers).
  - Grafana: to Visualize the data collected by Prometheus.
  - cAdvisor: To collect Containers data like CPU and Memory usage.
  - Node-Exporter: To Collect data about the host system.[To-Do]
  - Alpine: tThis container performs commands to add pre-configured dashboards to Grafana.
- You can add more metrics to the app.
- I've added bash script to start the project and destroy the alpine image after finishing its job, to reduce load on the system.
- You should exclude `.env` from your project becasue it has sensitive info (grafana credentials) but I kept it for you to try the project.


## Getting Started
- Run this command `docker compose up --build -d`
- Wait for 1 minute them Open Grafana Dashboard at `http://localhost:3010` and enter the username & password admin:admin.
- head to the Dashboards section and you will find three dashboards setup for you (python metrics, cAdvisor for containers insights, Node-Exporter for host system insights).

## To-Do
- [ ] Enhance Node-Exporter Installation and follow best-practices and gather more infor about it.
- [ ] Test Node-Exporter on Ubuntu.
- [ ] Add alerts using prometheus alerting manager and visuazlize it in Grafana.


## Get in Touch
If you have any questions, suggestions, or feedback, please feel free to reach out to me on my [LinkedIn account](https://www.linkedin.com/in/abdassalam-ahmad/).
