require 'rails_helper'

describe Machine, type: :model do
  describe 'instance methods' do
    it 'average price' do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Don's Mixed Drinks")
      snack_1 = machine.snacks.create(name: "skittles", price: 3)
      snack_2 = machine.snacks.create(name: "peanuts", price: 7)

      expect(machine.average).to eq(5)
    end
  end

  describe 'instance methods' do
    it 'average price' do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Don's Mixed Drinks")
      snack_1 = machine.snacks.create(name: "skittles", price: 3)
      snack_2 = machine.snacks.create(name: "peanuts", price: 7)

      expect(machine.count).to eq(2)
    end
  end
end
