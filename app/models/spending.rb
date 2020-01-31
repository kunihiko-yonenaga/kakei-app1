class Spending < ApplicationRecord
  has_many :spending_values, dependent: :destroy
end
