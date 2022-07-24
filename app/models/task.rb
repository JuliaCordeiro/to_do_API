class Task < ApplicationRecord
  validates :description, presence: true
  validates :isUrgent, presence: true
  validates :isDone, presence: true
end
