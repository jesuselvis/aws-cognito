
resource "aws_cognito_user_pool" "user_pool" {
  name = "user_pool_cognito"


  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }

  auto_verified_attributes = ["email"]

  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = true
    mutable             = false
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
  }

  email_verification_subject = "Your verification code"
  email_verification_message = "Your verification code is {####}"

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
}
