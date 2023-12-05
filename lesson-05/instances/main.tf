resource "aws_instance" "bipolarbitsapplication" {
    ami="ami-097a2df4ac947655f"
    instance_type="t2.micro"
    key_name="deployer-key"
    vpc_security_group_ids=[aws_security_group.sg-ssh.id,aws_security_group.sg-http.id,aws_security_group.sg-https.id]
  }

resource "aws_key_pair" "deployer-key" {
    key_name="deployer-key"
    public_key="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFc33s8aCo9x+/xGFSRo3ZK7+qxx4BiRE69u3DUWVgFR maksym.kharkavyi@mkharkavyi-me-2DP9K"

  
}


resource "aws_security_group" "sg-ssh" {
    name="Allow ssh"
    ingress {
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    
    }
}

resource "aws_security_group" "sg-http" {
    name="Allow http again"
    ingress {
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks=["172.31.0.0/16"]
    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    
    }
}


resource "aws_security_group" "sg-https" {
    name="Allow https"
    ingress {
        from_port=443
        to_port=443
        protocol="tcp"
        cidr_blocks=["172.31.0.0/16"]
    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    
    }
}