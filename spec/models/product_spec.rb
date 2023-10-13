require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      it "should product with all four fields set will indeed save successfully " do
        @category = Category.new(name: "Trees")
        @product = Product.new( name:  'Giant Tea',
        quantity: 1,
        category: @category,
        price: 64.99 )
        @product.save!
   
        expect(@product).to be_valid
       
      end
      it "should name not be blank " do
        @category = Category.new(name: "Trees")
        @product = Product.new( 
        quantity: 1,
        category: @category,
        price: 64.99 )
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "should price not be blank " do
        @category = Category.new(name: "Trees")
        @product = Product.new( name:  'Giant Tea',
        quantity: 1,
        category: @category )
       
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "should quantity not be blank " do
        @category = Category.new(name: "Trees")
        @product = Product.new( name:  'Giant Tea',
      
        category: @category,
        price: 64.99 )
       
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
      it "should category not be blank " do
        @category = Category.new(name: "Trees")
        @product = Product.new( name:  'Giant Tea',
        quantity: 1,
        
        price: 64.99 )
        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to include("Category must exist")
      end
  end
end
