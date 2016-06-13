def stock_picker(array)
	converted = []
	sorted = []
	max = []
	min = []
	
	array.each { |x| converted << x.to_i }
	sorted = converted.sort
	if sorted[-1] == converted[0]
		max = sorted[-2]
	else
		max = sorted[-1]
	end
	
	min = (converted[0..(converted.index(max))]).min

	puts "It would be best to buy on day #{converted.index(min)} and sell on day #{converted.index(max)}."
end

stock_picker([17,3,6,9,15,8,6,1,10])