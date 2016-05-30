def caesar_cypher(str, int)
	alphabet = ("a".."z").to_a
	a = str.split('').each { |x| 
		x.to_i + int if x =~ alphabet
	}
	puts a.join
end

caesar_cypher("How are you", 5)