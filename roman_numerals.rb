require 'rspec'

class RomanNumeral
	def roman_numerals(number)
		array = []

		numeral_pairs = { 
			'C' => 100, 
			'XC' => 90, 
			'L' => 50, 
			'XL' => 40, 
			'X' => 10, 
			'IX' => 9, 
			'V' => 5, 
			'IV' => 4, 
			'I' => 1
		}

		numeral_pairs.each do |numeral, value|
			(number/value).floor.times do
				array << numeral
			end
			number = number % value
			puts number
		end

		return array.join('')
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