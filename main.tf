module "aws-cognito" {
  source = "./aws-cognito-module"
  dominio_name = "serverapp"
  identifier = "api"
}