# aws-ec2-terraform-template
Template to create a VPC, internet gateway, subnets across 3 availability zones, a key-pair, an Ubuntu EC2 instance and then run provisioning commands on the instance with remote-exec

The example use case for this project is to set up a (pool) of RTMP servers on EC2 and set up appropriate subnets. The servers should be in a separate VPC, with its own internet gateway and subnets. Once started, the server should be provisioned by running a set of remote commands.

This terraform template is simple and can be expanded on as needed.

To use, configure the AWS secrets and subnet CIDR to your requirements. Then run:

```
terraform init
terraform plan
terraform apply
```
