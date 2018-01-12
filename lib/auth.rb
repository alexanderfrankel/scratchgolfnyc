require 'jwt'

class Auth
  ALGORITHM = 'HS256'

  def self.encode(payload)
    JWT.encode(payload,auth_secret,ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, auth_secret, ALGORITHM)
  end

  def self.auth_secret
    Rails.application.secrets.secret_key_base
  end
end
