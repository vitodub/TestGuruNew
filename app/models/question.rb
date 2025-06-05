class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  
  validates :body, presence: true

  validate :validate_answers_number

  def validate_answers_number
    errors.add(:answers_number) if answers.count.to_i != 1..4
  end
end
