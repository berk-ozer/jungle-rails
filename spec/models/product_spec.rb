require 'rails_helper'

RSpec.describe Product, type: :model do
  
  let(:category) {
    Category.new(name: "testCategory")
  }
  subject {
    category.products.new(
      name: "testProduct",
      description: "this is a test product",
      image: "testImage",
      price_cents: 995,
      quantity: 15,
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end
  end
end
