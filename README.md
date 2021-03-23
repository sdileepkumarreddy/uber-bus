# Uber-bus

# Introduction 
   -  It is MERN stack web application with provisioning and configuration management done using Terraform scripts to deploy application on AWS cloud with Elastic IP
   -  Admin can create locations and Buses available at each location. Locations are fetched via Google API
   -  Customer can book a bus during particular time period with a source and destination which are again fetched via locations google API
   -  We can view all the bookings or even modify them.
   -  Since static elastic IP is used application can be accessed at `http://100.24.201.251` once terraform script is executed

# Technical Stack
   - Frontend: ReactJS
   - Backend: NodeJS
   - Web Production server: Nginx
   - Backend Production Server: PM2 (production process manager for Node.js)
   - Database: MongoDB (Atlas cloud database)
   - Cloud: AWS EC2
   - Provisioning and Configuration Management: Terraform

# Prerequisites
   - NodeJs
   - MongoDb Client
   - Terraform
   - AWS Key Pair

# How To Run

### Locally
   - Execute `git clone https://github.com/sdileepkumarreddy/uber-bus.git`
   - Navigate to frontend folder and execute `npm install` and `npm start`
   - Navigate to backend folder and execute `npm install` and `npm start`
   - Website can be accessed at "http://localhost:3000/"

### Cloud(Terraform)
   - Execute `git clone https://github.com/sdileepkumarreddy/uber-bus.git`
   - Navigate to terraform folder and make sure you are replacing "dk-devops-viginia.pem" with your own AWS keypair
   - Execute `terraform init` and `terraform apply`
   - Application can be accessed at `http://100.24.201.251/`

# Contributors
   - Dileep Kumar Reddy Sirasani
   - Zhenlong Zou
