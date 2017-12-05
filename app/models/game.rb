class Game < ApplicationRecord
  validates :course_name, presence: true
  validates :date, presence: true
end
