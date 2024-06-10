resource "aws_cognito_user_pool_client" "user_pool_client" {
  name            = "user_pool_digital_dev_client_credentials"
  user_pool_id    = aws_cognito_user_pool.user_pool.id
  generate_secret = true

  explicit_auth_flows = [
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows = [
    "client_credentials"
  ]

  allowed_oauth_scopes = [
    "${aws_cognito_resource_server.resource_server.identifier}/read",
    "${aws_cognito_resource_server.resource_server.identifier}/write",
    "${aws_cognito_resource_server.resource_server.identifier}/update"
  ]

  #   callback_urls = ["https://yourapp.com/callback"]
  #   logout_urls   = ["https://yourapp.com/logout"]
  #   default_redirect_uri = "https://yourapp.com/callback"

  supported_identity_providers = ["COGNITO"]

  prevent_user_existence_errors = "ENABLED"
}

resource "aws_cognito_user_pool_domain" "name" {
  domain       = var.dominio_name
  user_pool_id = aws_cognito_user_pool.user_pool.id
}
