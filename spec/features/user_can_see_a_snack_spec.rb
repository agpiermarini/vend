require 'rails_helper'


describe 'As a user, when I visit a specific snack page' do
  it 'I see the name and price of the snack' do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing's Basement")
    snack = Snack.create(name: "skittles", price: 3)
    machine_snack_1 = MachineSnack.create(machine_id: machine_1.id, snack_id: snack.id)
    machine_snack_2 = MachineSnack.create(machine_id: machine_2.id, snack_id: snack.id)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
  end

  it 'see a list of locations with vending machines that carry that snack' do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing's Basement")
    snack = Snack.create(name: "skittles", price: 3)
    machine_snack_1 = MachineSnack.create(machine_id: machine_1.id, snack_id: snack.id)
    machine_snack_2 = MachineSnack.create(machine_id: machine_2.id, snack_id: snack.id)

    visit snack_path(snack)

    expect(page).to have_content(machine_1.location)
    expect(page).to have_content(machine_2.location)
  end

  it 'see the average price of snacks in the vending machines' do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing's Basement")
    snack = Snack.create(name: "skittles", price: 3)
    snack_2 = Snack.create(name: "peanuts", price: 7)
    machine_snack_1 = MachineSnack.create(machine_id: machine_1.id, snack_id: snack.id)
    machine_snack_2 = MachineSnack.create(machine_id: machine_2.id, snack_id: snack.id)
    machine_snack_1 = MachineSnack.create(machine_id: machine_1.id, snack_id: snack_2.id)
    machine_snack_2 = MachineSnack.create(machine_id: machine_2.id, snack_id: snack_2.id)


    visit snack_path(snack)

    expect(page).to have_content(machine_1.average)
    expect(page).to have_content(machine_2.average)
  end

  it 'see the count of snacks in the vending machines' do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing's Basement")
    snack = Snack.create(name: "skittles", price: 3)
    snack_2 = Snack.create(name: "peanuts", price: 7)
    machine_snack_1 = MachineSnack.create(machine_id: machine_1.id, snack_id: snack.id)
    machine_snack_2 = MachineSnack.create(machine_id: machine_2.id, snack_id: snack.id)
    machine_snack_1 = MachineSnack.create(machine_id: machine_1.id, snack_id: snack_2.id)
    machine_snack_2 = MachineSnack.create(machine_id: machine_2.id, snack_id: snack_2.id)


    visit snack_path(snack)

    expect(page).to have_content(machine_1.count)
    expect(page).to have_content(machine_2.count)
  end
end





# I see the average price for snacks in those vending machines
# And I see a count of the different kinds of items in that vending machine.
# ```
