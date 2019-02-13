require 'rspec'
require 'dessert'
# require 'chef'
=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) { Dessert.new('green',25,'ho chi min')}
  let(:chef) { double("chef") }
  
  
  describe "#initialize" do
    it "sets a type" do 
      expect(brownie.type).to eq('green')
    end
    it "sets a quantity" do 
      expect(brownie.quantity).to eq(25)
    end
    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      
      expect {Dessert.new("brownie", "tons")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    # subject(:brownie) { Dessert.new('green',25,'ho chi min')}
    it "adds an ingredient to the ingredients array" do 
      expect(brownie.ingredients).to_not include('cream')
      brownie.add_ingredient('cream')
      expect(brownie.ingredients).to include('cream')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      expect(brownie.ingredients).to_not include('cream', 'vegetable', 'tomato')
      # expect(brownie.ingredients).to_not include('vegetable')
      brownie.add_ingredient('cream')
      brownie.add_ingredient('vegetable')
      brownie.add_ingredient('tomato')
      dupp = brownie.ingredients.dup
      brownie.mix!
      expect(dupp).to_not eq(brownie.ingredients) 
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      expect(brownie.quantity).to_not eq(24)
      brownie.eat(1)
      expect(brownie.quantity).to eq(24)

    end

    it "raises an error if the amount is greater than the quantity" do 
      expect do
        brownie.eat(105)
      end.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect(brownie.serve).to include('ho chi min'.titleize)
    end
  end

  describe "#make_more" do

    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(:chef).to receive(:brownie).with(bake)
    end
  end
end
