variable "project_name" {

type = string

}


variable "cluster_version" {

type = string

}


variable "private_subnets" {

type = list(string)

}


variable "cluster_role_arn" {

type = string

}


variable "node_role_arn" {

type = string

}