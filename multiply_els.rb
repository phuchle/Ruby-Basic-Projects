require 'byebug'
public
def my_inj(accumulator=nil)
  return self unless block_given?
  accumulator.nil? ? self.first : accumulator
  self.each { |i| accumulator = yield(i, accumulator) }
  accumulator
end

def multiply_els(array)
  array.inject(1) { |sum, num| sum = sum * num}
end

p multiply_els([2,4,5]) == 40
p [1,2,3,4,5].my_inj { |running_total, x| running_total + x} #== 15
