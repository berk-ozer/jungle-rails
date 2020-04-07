require 'rails_helper'

RSpec.feature "Visitor clicks on a product in home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details page" do
    visit root_path

    find(".product:nth-of-type(1) img").click

    expect(page).to have_content("Description")
    expect(page).to have_content("Quantity")
  end
  
end
