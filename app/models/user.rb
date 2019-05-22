class User < ApplicationRecord
  enum user_role: { admin: 0, client: 1 }

  # encrypt password
  has_secure_password

  # validations
  validates_presence_of :email, :name, :password_digest
end
