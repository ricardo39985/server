class User < ApplicationRecord
  # Ensure these exist and are unique before even trying to save to the DB
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
