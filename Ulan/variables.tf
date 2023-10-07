variable region {
    type = string
    default = "us-east-1"
}

variable vpc_cidr {
    type = string
    default = "10.0.0.0/16"
}

variable subnet_cidr1 {
    type = string
    default = "10.0.1.0/24"
}

variable subnet_cidr2 {
    type = string
    default = "10.0.2.0/24"
}

variable subnet_cidr3 {
    type = string
    default = "10.0.3.0/24"
}

variable az1 {
    type = string
    default = "us-east-1a"
}

variable az2 {
    type = string
    default = "us-east-1b"
}

variable az3 {
    type = string
    default = "us-east-1c"
}

variable ip_on_launch {
    type = bool
    default = true
}