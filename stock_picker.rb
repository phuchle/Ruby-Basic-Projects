def stock_picker(array)
	converted = []
	picks = []
	array.each { |x| converted << x.to_i }
	if converted.index(converted.max) < converted.index(converted.min) 
		converted.delete(converted.max)
		picks << converted.max
	elsif converted.index(converted.max) == 0
		converted.delete(converted.max)
		picks << converted.max
	elsif converted.index(converted.min) == -1
		converted.delete(converted.min)
		picks << converted.min
	elsif converted.index(converted.max) > converted.index(converted.min)
		picks << converted.min
    end
    puts picks
end

stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([5,4,3,2,100])

https://repl.it/CYRO/3
