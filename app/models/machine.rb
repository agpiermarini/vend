class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average
    snacks.average(:price)
  end

  def count
    snacks.count
  end
end
