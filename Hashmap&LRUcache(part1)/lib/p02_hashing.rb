class Integer
  # Integer#hash already implemented for you

  
end

#expect([1,2].hash).to be_a(Integer)
#=> { 1 => 0, 2 => 1}

class Array
  # def hash
  #   return nil.to_i if self.empty? 
  #   # new_hash = {} 

  #   self.each do |num|
  #     idx = num.hash % self.length 
  #     new_hash[idx]  = num  
      
  #   end 
  #   new_hash

  # end 

end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
