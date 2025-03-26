class User < ApplicationRecord
  has_many :usertests
  has_many :tests, through: :usertests
  has_many :authortests, class_name: :Test, foreign_key: :author_id

  def tests_by_difficulty(level)
    tests.where(level: level)
  end
end
