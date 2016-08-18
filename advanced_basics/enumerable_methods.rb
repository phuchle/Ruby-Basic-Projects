module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    for i in (0...self.length)
      yield(self[i], i)
    end
  end

  def my_select
    return self unless block_given?
    new_array = []
    self.my_each { |i| new_array << i if yield(i) }
    new_array
  end

  def my_all?
    unless block_given?
      self.my_each { |i| return false if i == false }
    else
      self.my_each { |i| yield(i) } ? true : false
    end
  end

  def my_any?
    return self unless block_given?
    (self.my_select { |i| yield(i) }).length >= 1
  end

  def my_none?
    return self unless block_given?
    (self.my_select { |i| yield(i) }).length == 0
  end

  def my_count(value=nil)
    count = 0
    if value
      self.my_each {|i| count += 1 if i == value}
      return count
    elsif block_given?
       self.my_each { |i| count += 1 if yield(i) }
      return count
    elsif value.nil?
      return self.length
    end
  end

  def my_map(proc=nil)
    new_array = []
    unless proc
      self.my_each do |i|
        new_array <<  yield(i)
      end
    else
      self.my_each do |j|
        new_array << proc.call(j)
      end
    end
    new_array
  end

  def my_inject(accumulator=nil)
    return self unless block_given?
    accumulator.nil? ? accumulator = self.first : accumulator
    accumulator = 0 if self.first == 1
    self.my_each { |i| accumulator = yield(accumulator, i) }
    accumulator
  end
end

def multiply_els(array)
  array.inject { |sum, num| sum = sum * num }
end


puts "Tests:" + "\n \n"
puts "==================="

puts "my_each tests" + "\n \n"
p [1,2,3,4,5].my_each { |x| p x}
puts "\n \n"

puts "my_each_with_index tests" + "\n \n"
p ["A","B","C","D","E"].my_each_with_index { |x, index| puts "#{x}, #{index}"}
puts "\n"

puts "my_select tests" + "\n \n"
p [1,2,3,4,5].my_select { |x| x < 4} == [1,2,3]
puts "\n"

puts "my_all? tests" + "\n \n"
p ([false, false, true, false].my_all?) == false
p [1,2,3,4,5].my_all? { |x| x > 0} == true
p [1,2,3,4,5].my_all? { |x| x < 10} == true
puts "\n"

puts "my_any? tests" + "\n \n"
p [1,2,3,4,5].my_any? { |x| x > 5} == false
p [1,2,3,4,5].my_any? { |x| x > 2} == true
puts "\n"

puts "my_inject tests" + "\n \n"
p [1,2,3,4,5].my_inject { |running_total, x| running_total + x} == 15
p multiply_els([20,2,-3]) == -120
puts "\n"

puts "my_count tests" + "\n \n"
p [1,2,3,4,5].my_count == 5
p [1,2,3,4,5].my_count(3) == 1
p [1,2,3,4,5].my_count { |x| x > 2} == 3
puts "\n"

puts "my_map tests" + "\n \n"
test = Proc.new{ |z| z ** 3}
p [1,2,3,4,5].my_map(test) { |y| y * 2} == [1,8,27,64,125]
p [1,2,3,4,5].my_map(test) == [1,8,27,64,125]
p ([1,2,3,4,5].my_map { |y| y*2}) == [2,4,6,8,10]
