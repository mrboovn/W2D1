# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length != 0
        max = self.max
        min = self.min
        dif = max - min
        return dif.abs()
    else
        return nil
    end 
  end

  def average
    if self.length != 0 
        return self.sum / (self.length * 1.0)
    else
        return nil
    end 
  end 

  def any_odd
    arr = self.map {|num| num.odd?}
    if arr.include?(true)
        return true
    else
        return false
    end
  end

  def any_even
    arr = self.map {|num| num.even?}
    if arr.include?(true)
        return true
    else
        return false
    end
  end

  def median
    if self.length != 0 
        if self.length.odd?
            return self.sort[length/2]
        else 
            return (self.sort[length/2] + self.sort[length/2 - 1])/2.0
        end
    else
        return nil
    end
  end

  def counts
    hash = Hash.new
    self.each do |val|
        if hash.has_key?(val)
            hash[val] += 1
        else 
            hash[val] = 1
        end
    end
    return hash
  end

  # part 2
  def my_count(arg)
    hash = self.counts()
    if hash.has_key?(arg)
        return hash[arg]
    else
        return 0
    end
  end

  def my_index(arg)
    self.each_with_index do |val,idx|
        if val == arg
            return idx
        end
    end
    return nil
  end

  def my_uniq
    arr = []
    self.each do |val|
        if arr.include?(val) == false
            arr << val
        end
    end
    return arr
  end

  def my_transpose
    arr = Array.new(self.length) { Array.new()}
    (0...self.length).each do |i|
        (0...self.length).each do |j|
            arr[i] << self[j][i]
        end
    end
    return arr
  end


end
