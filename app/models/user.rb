class User < ApplicationRecord
before_save :downcase_email
VALID_EMAIL_REGEX = Settings.validates.regex.email
validates :name, presence: true,
          length: {maximum: Settings.validates.length.name_max}
validates :email, presence: true,
          length: {maximum: Settings.validates.length.mail_max},
format: { with: VALID_EMAIL_REGEX },
uniqueness: true
validates :password, presence: true,
          length: {minimum: Settings.validates.length.password_min}
has_secure_password

  private
  def downcase_email
    email.downcase!
  end
end
