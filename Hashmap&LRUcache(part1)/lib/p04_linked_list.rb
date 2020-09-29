class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList 
  def initialize
    @head = Node.new 
    @tail = Node.new 
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next  
  end

  def last
    @tail.prev 
  end

  def empty?
    if @head.next == @tail
      return true
    else
      return false
    end
  end

  def get(key)
    self[].key
  end

  def include?(key)
    
  end

  def append(key, val) #head => first => second => tail 
    next_link = Node.new(key, val)

    self.each_with_index do |link, idx|
      self[idx]

    next_linknext = next_link[+1].next 
    next_link.prev = next_link[i-1].prev 
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
