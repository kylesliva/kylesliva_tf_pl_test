variable "server_name" {
    description = "Name tag for blog EC2"
    type = string
    default = "blog_server"
}

variable "keypair" {
    description = "keypair for blog EC2"
    type = string
    default = "blog_keypair"
}

variable "subnet" {
    description = "Subnet to use for blog"
    type = string
    default = "subnet-06cedc805b1fba76b"
}

variable "webvpc" {
    description = "target VPC"
    type = string
    default = "vpc-040a352b8c288be4f"
}

variable "mgmtsg" {
    description = "SSH SG"
    type = string
    default = "sg-0eceea5b6a0370ad9"
}

variable "websg" {
    description = "Web Egress SG"
    type = string
    default = "sg-0671f0b358f1ddf30"
}

variable "entries" {
    type = map(string)
    default = {
        cidr1 = "10.0.1.0/24",
        cidr2 = "10.0.2.0/24",
        cide3 = "10.0.3.0/24"
    }
}