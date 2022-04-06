class User < ApplicationRecord
  before_save{self.email = email.downcase}
  validates :name, presence: true,
  length: {maximum: Settings.validates.length.name_max}
  VALID_EMAIL_REGEX = Settings.validates.regrex.email
  validates :email, presence: true,
            length: {maximum: Settings.validates.length.mail_max},
                    format: {with: VALID_EMAIL_REGEX},
  uniqueness: true

  has_secure_password
  validates :password, presence: true,
  length: {minimum: Settings.validates.length.password_min}
end
