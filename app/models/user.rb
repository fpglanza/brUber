class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :posts

  validates :username,presence: true,
            length: {minimum: 6, maximum: 18 },
            uniqueness: { case_sensitive: false }
            
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true,
            length: { maximum: 50 },
            uniqueness: { case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }
end