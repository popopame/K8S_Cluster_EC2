#This file contain the Access to the AWS account and basic configuration for access

provider "aws" {
  region                  = var.region
  shared_credentials_file = "/home/popopame/.aws/credentials"
  profile                 = "default"

}
