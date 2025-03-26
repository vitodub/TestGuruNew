class Test < ApplicationRecord

  belongs_to :category, dependent: :destroy
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :users, through: :usertests
  has_many :usertests

  def self.name_by_category(category)
    Test.joins(:category)
      .where(category: { title: category }).order(title: :desc)
      .pluck(:title)
  end
end


