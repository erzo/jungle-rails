require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    # validation tests/examples here
    it "should not be valid without a name" do
      category = Category.new(:name => "Apparel")
      product = Product.new(
        :category => category,
        :quantity => 5,
        :price => 10)
      product.save
      expect(product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'should not be valid without a price' do
      category = Category.new(:name => "Shoes")
      product = Product.new(
        :name => "G",
        :category => category,
        :quantity => 5)
      product.save
      expect(product.errors.full_messages[0]).to be_present
    end

    it "should not be valid without a quantity" do
      category = Category.new(:name => "Apparel")
      product = Product.new(
        :category => category,
        :name => "Kylo",
        :price => 10)
      product.save
      expect(product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'should not be valid without a category' do
      category = Category.new(:name => "Clothes")
      product = Product.new(
        :name => "Venti",
        :quantity => 12,
        :price => 10)
      product.save
      expect(product.errors.full_messages[0]).to eq("Category can't be blank")
    end

    it 'should be valid' do
      category = Category.new(:name => "Technology")
      product = Product.new(
        :name => "f",
        :quantity => 12,
        :price => 10,
        :category => category)
      product.save
      expect(product.errors.full_messages[0]).to be_nil
    end

    

  end

end
