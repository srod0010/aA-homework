fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fishes)
  fishes.each do |fish1|
    longest = true
    fishes.each do |fish2|
      longest = false if fish2.length > fish1.length
    end
    return fish1 if longest
  end
end

p sluggish_octopus(fishes)


class Array
  #this should look familiar
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1

    mid = count / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        merged << right.shift
      else
        merged << left.shift
      end
    end

    merged + left + right
  end
end

def clever_octopus(fishes)
  longest = 0
  long_fish = ''

  fishes.each do |fish|
    if fish.length > longest
      longest = fish.length
      long_fish = fish
    end
  end
  long_fish
end
p clever_octopus(fishes)



tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each do |tile|
    return tile.index(direction) if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
