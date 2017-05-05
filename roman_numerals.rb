require 'rspec'

class RomanNumeral
	def roman_numerals(number)
		array = []

		# numerals = ['C', 'XC', 'L', 'XL', 'V', 'IV', 'I']
		# numeral_values = [100, 90, 50, 40, 5, 4, 1]

		# numeral_pairs = { 'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40, 'V' => 5, 'IV' => 4, 'I' => 1 }

		while number > 0
			if number >= 100
				array << 'C'
				number -= 100
			elsif number == 90
				array << 'XC'
				number -= 90
			elsif number >= 50
				array <<  'L'
				number -= 50
			elsif number == 40
				array << 'XL'
				number -= 40
			elsif number >= 10
				array << 'X'
				number -= 10
			elsif number >= 5
				array << 'V'
				number -= 5
			elsif number == 4
				array << 'IV'
				number -=4
			elsif number >= 1
				array << 'I'
				number -= 1
			end

		end
		return array.join('')

		# numeral_values.each do |numeral_value|
		# 	(number/numeral_value).floor.times do
		# 		array << 
		# 	end
		# end
	end



end

RSpec.describe RomanNumeral do
	describe "#ones" do
		it 'should return a roman numeral for a single number' do
			numeral = RomanNumeral.new
			expect(numeral.roman_numerals(1)).to eq("I")
			expect(numeral.roman_numerals(6)).to eq("VI")
			expect(numeral.roman_numerals(4)).to eq("IV")
			expect(numeral.roman_numerals(7)).to eq("VII")
			expect(numeral.roman_numerals(10)).to eq("X")
		end
	end

	describe "#Tens" do
		it 'should return a roman numeral for a single number' do
			numeral = RomanNumeral.new
			expect(numeral.roman_numerals(10)).to eq("X")
			expect(numeral.roman_numerals(80)).to eq("LXXX")
			expect(numeral.roman_numerals(84)).to eq("LXXXIV")
			expect(numeral.roman_numerals(88)).to eq("LXXXVIII")
		end
	end

	describe "#Fifties" do
		it 'should return a special roman numeral for 50s and numbers nearby' do
			numeral = RomanNumeral.new
			expect(numeral.roman_numerals(50)).to eq("L")
			expect(numeral.roman_numerals(40)).to eq("XL")
			expect(numeral.roman_numerals(60)).to eq("LX")
		end
	end

	describe "#Ninties" do
		it 'should return a special roman numeral for 90s and numbers nearby' do
			numeral = RomanNumeral.new
			expect(numeral.roman_numerals(90)).to eq("XC")
			expect(numeral.roman_numerals(100)).to eq("C")
		end
	end

end