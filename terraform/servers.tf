resource "aws_instance" "test-ec2-instance" {
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name = "${var.ami_key_pair_name}"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
subnet_id = "${aws_subnet.subnet-uno.id}"
}

resource "null_resource" "connect_bastion1" {
  # provisioner "file" {
  #   source      = "remoteBash.sh"
  #   destination = "/tmp/remoteBash.sh"
  # }

  provisioner "remote-exec" {
    inline = [
      "cd ~",
      "export REACT_APP_SERVER_URL=http://100.24.201.251:3001/api",
      "sudo apt-get update && sudo apt-get -y upgrade",
      "sudo apt-get update && sudo apt-get -y upgrade",
      "sudo apt install -y npm",
      "git clone https://github.com/sdileepkumarreddy/uber-bus.git",
      "sudo apt-get install nginx -y",
      "sudo npm install -y pm2 -g",
      "npm install --save-dev dotenv",
      "export REACT_APP_SERVER_URL=http://100.24.201.251:3001/api",
      "cd uber-bus/frontend/",
      "npm install",
      "npm run build",
      "cd ~",
      "sudo rm /etc/nginx/sites-enabled/default",
      "cd uber-bus/",
      "sudo cp uberbus.nginx /etc/nginx/sites-available/",
      "sudo ln -s /etc/nginx/sites-available/uberbus.nginx /etc/nginx/sites-enabled/uberbus.nginx",
      "sudo systemctl reload nginx",
      "cd backend/",
      "npm install",
      "pm2 start app_server.js"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.keyPath)
    host        = "100.24.201.251"
    agent       = false
  }
}