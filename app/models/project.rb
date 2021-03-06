class Project < ActiveRecord::Base

  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum:10}

  has_many :tasks
  belongs_to :user
end
