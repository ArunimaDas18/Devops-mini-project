terraform {
  backend "s3" {

    bucket = "tf-state-ad"
    key = "devops-mini-project/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    
  }
}