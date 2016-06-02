def caesar_cypher(str, int)
	alphabet = ("a".."z").to_a + ("A".."Z").to_a
	translated = []
	a = str.split('').each { |letter| 
		
		if alphabet.include? letter
			shifted = (letter.ord + int)
			if shifted > 64 && shifted < 91 || shifted > 96 && shifted < 123
				translated << shifted.chr
			else
				translated << (shifted - 26).chr
			end
		else
			translated << letter
		end
	}
	puts translated.join
end

def caesar_decypher(str, int)
	alphabet = ("a".."z").to_a + ("A".."Z").to_a
	translated = []
	a = str.split('').each { |letter| 
		if alphabet.include? letter
			shifted = (letter.ord - int)
			if shifted > 64 && shifted < 91 || shifted > 96 && shifted < 123
				translated << shifted.chr
			else
				translated << (shifted - 26).chr
			end
		else
			translated << letter
		end
	}
	puts translated.join
end

puts "Enter text to be encrypted:"
str = gets.chomp

puts "Enter the shift factor:"
int = gets.chomp.to_i

puts caesar_cypher(str, int)

puts "Enter text to be deciphered:"
str = gets.chomp

puts "Enter the shift factor:"
int = gets.chomp.to_i

puts caesar_decypher(str, int)