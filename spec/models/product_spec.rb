require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    it "Validates new product" do
      @category = Category.create(name: 'Bowling')
      @product = @category.products.create(name: 'Cool shoes', description: 'test', image: 'test', price_cents: 20000, quantity: 2)

      expect(@product).to be_valid
      @product.errors.full_messages
    end
    it "Validates name precense true" do
      @category = Category.create(name: 'Bowling')
      @product = @category.products.create(name: nil, description: 'test', image: 'test', price_cents: 20000, quantity: 2)

      expect(@product).not_to be_valid
      @product.errors.full_messages
    end
    it "Validates price precense true" do
      @category = Category.create(name: 'Bowling')
      @product = @category.products.create(name: 'Cool shoes', description: 'test', image: 'test', price_cents: nil, quantity: 2)

      expect(@product).not_to be_valid
      @product.errors.full_messages
    end
    it "Validates quantity precense true" do
      @category = Category.create(name: 'Bowling')
      @product = @category.products.create(name: 'Cool shoes', description: 'test', image: 'test', price_cents: 20000, quantity: nil)

      expect(@product).not_to be_valid
      @product.errors.full_messages
    end
    it "Validates category precense true" do
      @product = Product.create(name: 'Cool shoes', description: 'test', image: 'test', price_cents: 20000, quantity: 2)

      expect(@product).not_to be_valid
      @product.errors.full_messages
    end
  end
end
