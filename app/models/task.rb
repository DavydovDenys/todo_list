class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  
  belongs_to :project

  PRIORITIES = [
    ['Later', 1],
    ['Next', 2],
    ['Now', 3]
  ]

  def complete!
    self.completed = true
    save
  end 


end
