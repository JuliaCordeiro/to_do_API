class Task < ApplicationRecord
  validates :description, presence: true
  validates :isUrgent,  inclusion: { in: [ true, false ] }
  validates :isDone,  inclusion: { in: [ true, false ] }
end
