require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it "is valid with valid attributes" do
      user = User.new(first_name: "Berk", last_name: "Ozer", email: "galipberkozer@gmail.com", password: "secret", password_confirmation: "secret")
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end
  end
end
