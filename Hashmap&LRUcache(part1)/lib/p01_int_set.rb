class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max) {false} 
  end

  def insert(num)
    if is_valid?(num) && !self.include?(num) 
      @store[num] = true 
    else 
      raise "Out of bounds"
    end 
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    end
  end

  def include?(num)
    if @store[num] == true 
      return true 
    else 
      return false 
    end 
  end

  private

  def is_valid?(num)
    if num <= self.store.length && num >= 0 
      return true 
    else 
      return false 
    end 
  end

  def validate!(num)
    
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % num_buckets
    self[idx] << num 
  end

  def remove(num)
    idx = num % num_buckets
    self[idx].delete_if { |ele| ele == num } 
  end

  def include?(num)
    #[[1],[],[]] => true 
    p idx = num % num_buckets
    self[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num] 
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if count < num_buckets && !self.include?(num)
      idx = num % num_buckets
      self[idx] << num
      @count += 1
    else 
      resize!
      idx = num % num_buckets
      self[idx] << num
      @count += 1
    end 
  end

  def remove(num)
    if self.include?(num)
      idx = num % num_buckets
      self[idx].delete_if { |ele| ele == num }
      @count -= 1
    end
  end

  def include?(num)
    idx = num % num_buckets
    self[idx].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num = num_buckets * 2
    copied = @store.clone
    @store = Array.new(new_num) { Array.new }
    @count = 0
    copied.each do |sub_arr|
      sub_arr.each do |ele|
        idx = ele % new_num
        @store[idx] << ele
        @count += 1
      end
    end
    return @store
  end
end
