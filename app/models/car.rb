class Car < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :govnum, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
end
