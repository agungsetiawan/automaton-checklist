class User < ActiveRecord::Base

  has_many :projects
  has_secure_password

  validates :username,presence: true, uniqueness: {case_sensitive: false}
  validates :email,presence: true, uniqueness: {case_sensitive: false}
  
end
