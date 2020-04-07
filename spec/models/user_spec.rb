require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it "is valid with valid attributes" do
      user = User.create(first_name: "Berk", last_name: "Ozer", email: "galipberkozer@gmail.com", password: "secret", password_confirmation: "secret")
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end

    it "is not valid when password and password_confirmation don't match" do
      user = User.create(first_name: "Test", last_name: "Person", email: "test1@gmail.com", password: "something", password_confirmation: "else")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
  end
end
