require 'rails_helper'

feature "When a user visits the vending machine index" do
  it "they see a list of vending machine locations" do
    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Don's Mixed Drinks")
    snack_1 = machine.snacks.create(name: "skittles")
    snack_2 = machine.snacks.create(name: "peanuts")

    visit machine_path(machine)

    expect(page).to have_content("Sam's Snacks Machine")
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_2.name)
  end
end


# ```
# As a user
# When I visit a specific vending machine page
# I see the name of all of the snacks associated with that vending machine along with their price
# ```
