# implementation of the Verhoeff checksum algorithm
module Verhoeff
  {% begin %}
    VERSION = {{ `shards version "#{__DIR__}"`.chomp.stringify.downcase }}
  {% end %}

  # Dihedral multiplication table
  D = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
       [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
       [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
       [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
       [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
       [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
       [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
       [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
       [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]]

  # Permutation table
  P = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
       [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
       [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
       [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
       [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
       [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
       [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
       [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]]

  # Inversion table
  INV = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9]

  def self.generate_checksum(num_str : String) : Int32
    c = 0
    len = num_str.size

    len.times do |i|
      c = D[c][P[((i + 1) % 8)][num_str[len - i - 1].to_i - '0'.to_i]]
    end

    INV[c]
  end

  def self.generate_checksum(num : Int) : Int32
    generate_checksum num.to_s
  end

  def self.validate(num_str : String) : Bool
    c = 0
    len = num_str.size

    len.times do |i|
      c = D[c][P[(i % 8)][num_str[len - i - 1].to_i - '0'.to_i]]
    end

    c == 0
  end

  def self.validate(num : Int) : Bool
    validate num.to_s
  end
end
