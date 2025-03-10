// Provider
provider "aws" {
    region = "us-east-2"
    access_key = 
    secret_key = 
  
}

//  Create ec2 instance
resource "aws_instance" "Apache" {
    availability_zone = "us-east-2"
    ami = "ami-085f9c64a9b75eed5"
    instance_type = "t2.micro"
    key_name = "home"
    vpc_security_group_ids = [aws_security_group.DEfatt.id]

    //Create main disk
    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 8
        volume_type = "gp3"
        tags = {
            Neme = "root-disk"
        }

            }
    // User script
    user_data = file("install.sh")

    // Tags
    tags = {
        Neme = "EC2-Instance"
    }
}
//Create security group
resource "aws_security_group" "DEfatt" {
    name = "DEfatt.id"
    description = "Allow 22, 80, 443 inboud taffic"

    ingress {
        description = "Allow HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

     ingress {
        description = "Allow HTTPS"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

     ingress {
        description = "Allow SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

     ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
