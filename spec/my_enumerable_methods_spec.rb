require "./lib/my_enumerable_methods.rb"

RSpec.describe Enumerable do 

    let(:arr){[1,2,3,4,5,6,7,8,9,10]}

    context "my_select" do
        it "returns each item for which the block evaluates to true" do
            expect(arr.my_select {|i| i % 2 == 0 }).to eql([2,4,6,8,10])
        end
    end

    context "my_all?" do
        it "checks if all items evaluate to true" do
            expect(arr.my_all? { |i| i > 0 }).to eql(true)
        end
        it "checks if all items evaulate to true" do
            expect(arr.my_all? { |i| i > 2 }).to eql(false) 
        end
    end

    context "my_none?" do
        it "returns true if the block never returns true" do
            expect(arr.my_none? { |i| i > 20 }).to eql(true)
        end
        it "returns false if the block returns true" do
            expect(arr.my_none? { |i| i > 5 }).not_to eql(true)
        end
    end

end