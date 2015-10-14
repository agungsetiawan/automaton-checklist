class Task < ActiveRecord::Base
  belongs_to :project

  validates :body, presence: true
end
