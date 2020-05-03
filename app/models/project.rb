class Project < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }

  has_many :tasks, dependent: :destroy 
end
