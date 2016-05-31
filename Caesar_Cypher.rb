def caesar_cypher(str, int)
	alphabet = ("a".."z").to_a
	a = str.split('').each { |letter| 
		if alphabet.include? letter {
			letter.ord + int 
			letter.chr
		}
	}
	puts a.join
end

caesar_cypher("What a string!", 5)