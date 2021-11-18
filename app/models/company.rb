class Company < ApplicationRecord
    has_many :cars

    validates :name, presence: true
    validates :iin, presence: true
    validates :turnover, presence: true
end
