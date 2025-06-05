class User < ApplicationRecord
  has_many :usertests
  has_many :tests, through: :usertests, dependent: :destroy
  has_many :authortests, class_name: :Test, foreign_key: :author_id

  validates :email, presence: true

  scope :tests_by_difficulty, -> (level) { where(level: level) }

  def tests_by_difficulty(level)
    tests.where(level: level)
  end
end
