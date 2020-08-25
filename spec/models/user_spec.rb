require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validation' do
    it 'valid user should have no errors' do
    user = User.new(
      :first_name => "Kylo",
      :last_name => "Ren",
      :email => "kyloren@example.com",
      :password => "1234",
      :password_confirmation => "1234"
    )
    user.save
    expect(user.errors.full_messages[0]).to be_nil
    end

    it 'password mismatch should give an error' do
      user = User.new(
        :first_name => "Kylo",
        :last_name => "Ren",
        :email => "kyloren@example.com",
        :password => "321",
        :password_confirmation => "3211"
      )
      user.save
      expect(user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it 'password mismatch should give an error' do
      user = User.new(
        :first_name => "Kylo",
        :last_name => "Ren",
        :email => "kyloren@example.com",
        :password => "321",
        :password_confirmation => "321"
      )
      user.save
      expect(user.errors.full_messages[0]).to be_nil
    end
    
    it 'password too short should give an error' do
      user = User.new(
        :first_name => "Kylo",
        :last_name => "Ren",
        :email => "kyloren@example.com",
        :password => "17",
        :password_confirmation => "17"
      )
      user.save
      expect(user.errors.full_messages[0]).to eq("Password is too short, must be at least 3 characters")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "when using valid credentials" do
      user = User.new(
        :first_name => "Kylo",
        :last_name => "Ren",
        :email => "kyloren@example.com",
        :password => "1717",
        :password_confirmation => "1717"
      )
      user.save
      expect(User.authenticate_with_credentials("kyloren@example.com", "1717")).to be_present
    end

    it "when not using a valid email" do
      user = User.new(
        :first_name => "Kylo",
        :last_name => "Ren",
        :email => "kyloren@example.com",
        :password => "1717",
        :password_confirmation => "1717"
      )
      user.save
      expect(User.authenticate_with_credentials("kylo@example.com", "1717")).to be_nil
    end

    it "when using varied uppercase in email" do
      user = User.new(
        :first_name => "Kylo",
        :last_name => "Ren",
        :email => "kyloren@EXample.com",
        :password => "1717",
        :password_confirmation => "1717"
      )
      user.save
      expect(User.authenticate_with_credentials("KYloren@example.com", "1717")).to be_present
    end

    it "when having initial or trailing spaces in email" do
      user = User.new(
        :first_name => "Kylo",
        :last_name => "Ren",
        :email => "kyloren@example.com",
        :password => "1717",
        :password_confirmation => "1717"
      )
      user.save
      expect(User.authenticate_with_credentials("  kyloren@example.com", "1717")).to be_present
    end
  end
  

end