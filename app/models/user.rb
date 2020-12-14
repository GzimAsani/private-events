class User < ApplicationRecord
  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :attended_events, class_name: 'Event', foreign_key: 'event_id', through: :attendances
end