class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if self.count < num_buckets && !self.include?(key)
      idx = key.hash % num_buckets
      self[idx] << key 
      @count += 1
    else 
      resize!
       idx = key.hash % num_buckets
      self[idx] << key 
      @count += 1
    end 
  end

  def include?(key)
    idx = key.hash % num_buckets
    self[idx].include?(key)  
  end

  def remove(key)
    if self.include?(key)
      idx = key.hash % num_buckets
      self[idx].delete_if {|ele| ele == key} 
      @count -= 1 
    end 
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
      sub_arr.each do |key|
        idx = key.hash % new_num
        @store[idx] << key 
        @count += 1
      end
    end
    return @store
  end
end
