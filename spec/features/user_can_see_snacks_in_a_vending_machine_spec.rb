require 'rails_helper'

feature "When a user visits a vending machine show" do
  it "they see a list of snacks in the vending machine" do
    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Don's Mixed Drinks")
    snack_1 = machine.snacks.create(name: "skittles", price: 3)
    snack_2 = machine.snacks.create(name: "peanuts", price: 7)

    visit machine_path(machine)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_2.name)
  end

  it "they see the average price of all snacks in the machine" do
    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Don's Mixed Drinks")
    snack_1 = machine.snacks.create(name: "skittles", price: 3)
    snack_2 = machine.snacks.create(name: "peanuts", price: 7)

    visit machine_path(machine)
    expect(page).to have_content("Average Price of Snacks: #{machine.average}")
  end
end


# As a user
# When I visit a specific vending machine page
# I also see an average price for all of the snacks in that machine
# ```
