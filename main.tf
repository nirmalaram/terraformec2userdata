data "aws_vpc""existvpc"{
  id = "vpc-03d475c0c78eb70f6"
}
data "aws_subnet" "existsn" {
  filter {
    
    name = "tag:Name"
    values = [ "pubsubnet" ]
  }
  
}
data "aws_security_group" "existsg" {
  id = "sg-02dad2c129c2bfaa6"
}
resource "aws_instance" "ec2-userdata" {
  ami = "ami-04ff98ccbfa41c9ad"
  instance_type = "t2.micro"
  key_name = "NVirginiakey"
  user_data = file("udfile.sh")
  subnet_id = data.aws_subnet.existsn.id
  vpc_security_group_ids = [ data.aws_security_group.existsg.id ]
  tags = {
    Name="serverud"
  }
}  
