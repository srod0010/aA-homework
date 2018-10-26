class Stack
  attr_accessor :stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      self.stack << el
    end

    def pop
      # removes one element from the stack
      self.stack = stack[0...-1]
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      self.stack[-1]
    end
end

class Queue
  attr_accessor :stack
  def initialize
    @stack = []
  end

  def enqueue(el)
    self.stack = stack + [el]
  end

  def dequeue
    self.stack = stack[1..-1]
  end

  def peek
    self.stack[0]
  end
end


class Map
  # was not able to solve this one
  attr_accessor :arr
  def initialize
    @arr = []
  end

  def set(key, value)
    location = arr.index {|array| array[i] == key}

    if location
      arr[location][1] = value
    else
      arr << [key, value]
    end

    value
  end

  def get(key)
    arr.each {|pair| return arr[1] if arr[0] == key }
    nil
  end

  def delete(key)
    val = get(key)
    arr.reject! {|pair| pair[0] == key}
  end

  def show
    arr2 = arr.map do |el|
      if el.is_a?(Array)
        show(el)
      else
        el
      end
    end
    arr2
  end
end
