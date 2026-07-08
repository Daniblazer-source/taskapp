data "http" "public_ip" {
  url = "https://checkip.amazonaws.com"
}

locals {
  current_public_ip = "${chomp(data.http.public_ip.response_body)}/32"
}