require 'rspec'

class Change
	def make_change(number)
		coins = []
		total = number

		while total > 0
			
			while total % 5 != 0
				coins << 1
				total -= 1
			end

			while total % 10 != 0 
				coins << 5
				total -= 5
			end

			while total % 25 != 0
				coins << 10
				total -= 10
			end

			if (total >= 25) && (total % 25 == 0)
				coins << 25
				total -= 25
			end

			
		end
		coins.reverse
	end


end


RSpec.describe Change do
	describe "#pennies" do
		it 'should return an array of 1s when given a number' do
			change = Change.new
			expect(change.make_change(4)).to eq([1,1,1,1])
		end		
	end

	describe "#nickles_and_pennies" do
		it 'should return an array containing 5s and 1s when given a number' do
			change = Change.new
			expect(change.make_change(6)).to eq([5,1])
			expect(change.make_change(7)).to eq([5,1,1])
		end
	end

	describe "#dimes" do
		it 'should return an array of 10s, 5s, 1s when given a number' do
			change = Change.new
			expect(change.make_change(19)).to eq([10,5,1, 1, 1, 1])
		end
	end

	describe "#quarters" do
		it 'should return array of 25s,10s,5s,1a when given a number' do
			change = Change.new
			expect(change.make_change(42)).to eq([25,10,5,1,1])
		end
	end
end




