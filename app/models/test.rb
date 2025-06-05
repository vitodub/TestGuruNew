class Test < ApplicationRecord
  INFINITY = Float::INFINITY

  belongs_to :category, dependent: :destroy
  belongs_to :author, class_name: :User, foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :users, through: :usertests
  has_many :usertests

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..INFINITY) }
  scope :name_by_category, -> (category) { joins(:category).where(category: { title: category }).order(title: :desc).pluck(:title) }

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true, :greater_than: 0 }, uniqueness: true

  def self.name_by_category(category)
    Test.joins(:category)
      .where(category: { title: category }).order(title: :desc)
      .pluck(:title)
  end
end


