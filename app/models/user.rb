class User < ApplicationRecord
  has_many :work_experiences, dependent: :destroy
  has_many :comments, as: :commentable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :fullname, presence: true, length: { minimum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  enum role: [:manager, :member]
end
