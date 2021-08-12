class Produto < ApplicationRecord

  belongs_to :departamento, optional: true

  validates :price, :departamento, presence: true
  validates :name, presence: true, length:{minimum: 4}
end
