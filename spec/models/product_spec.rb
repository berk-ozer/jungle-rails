require 'rails_helper'

RSpec.describe Product, type: :model do
  
  let(:category) {
    Category.create(name: "testCategory")
  }
  subject {
    category.products.create(
      name: "testProduct",
      price_cents: 995,
      quantity: 15,
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Name can't be blank"
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end

    it "is not valid without a category" do
      product = Product.create(
        name: "testProduct",
        price_cents: 995,
        quantity: 15,
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
