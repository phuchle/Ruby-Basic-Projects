def caesar_cypher(str, int)
	a = str.split(',')
	a.each { |x| 
		x.to_i + int
	}
	print a.join
end