module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0...self.length
      yield(i, self[i])
    end
  end

  def my_select
    return self unless block_given?
    new_array = []
    self.my_each { |i| new_array << i if yield(i) }
    new_array
  end

  def my_all?
    return self unless block_given?
    self.my_each { |i| yield(i) } ? true : false
  end

  def my_any?
    return self unless block_given?
    (self.my_select { |i| yield(i) } ).length >= 1
  end

  def my_none?
    return self unless block_given?
    (self.my_select { |i| yield(i) } ).length = 0
  end

  def my_count
    return self unless block_given?
    count = 0
    count += 1 if self.my_each {|i| yield(i) }
  end

  def my_map
    return self unless block_given?
    new_array = []
    new_array <<  yield(i)
  end

  def my_inject
    return self unless block_given?

  end

end
