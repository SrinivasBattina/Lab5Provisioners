 #!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx jq
echo "<h1>Deployed via Terraform on ${var.vpc_name}-public-servers-${count.index+1} </h1>" | | sudo tee /var/www/html/index.nginx-debian.html