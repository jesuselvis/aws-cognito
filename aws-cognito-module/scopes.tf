resource "aws_cognito_resource_server" "resource_server" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  identifier   = var.identifier
  name         = "cognito server"

  scope {
    scope_name        = "read"
    scope_description = "Read access"
  }

  scope {
    scope_name        = "write"
    scope_description = "Write access"
  }

  scope {
    scope_name        = "update"
    scope_description = "Update access"
  }

  depends_on = [aws_cognito_user_pool.user_pool]
}

