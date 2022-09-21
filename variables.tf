variable "awsprops" {
  type = map(string)
  default = {
    region = "us-east-1"
    ami   = "ami-08d4ac5b634553e16"
    itype = "t2.micro"
    key-name = "amit-key"
    vol_size  = "30"
    publicip     = true
    keyname      = "amit-key"
  }
}
