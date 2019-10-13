require 'gene'

class Chromosome
  def initialize length
    @length = length
    @genes = get_genes length
  end

  def decode
    decoded = []
    @genes.each do |gene|
      decoded << gene.get_value
    end
    # puts "decoded"
    # puts decoded
    decoded_array = self.class.filter(decoded)
    p decoded_array
    return self.class.math(decoded_array)
  end

  def fitness target
  end

  def bits
  end

  def mutate position
  end

  def self.filter decoded
    filtered_array = []
    state = "number"
    decoded.each do |item|
      # puts item
      if state == "number"
        if item.is_a? Integer
          # puts "number"
          filtered_array << item
          # puts filtered_array
          state = "operator"
        end
      else
        if item.is_a? String
          # puts "operator"
          filtered_array << item
          # puts filtered_array
          state = "number"
        end
      end
    end
    if filtered_array[filtered_array.length - 1].is_a? String
      filtered_array.pop
    end
    return filtered_array
  end

  def self.math array
    result = array === [] ? 0.0 : array[0].to_f
    (1..array.length - 2).step(2) do |i|
      result = result.send(array[i].to_sym, array[i + 1])
    end
    result
  end

  private
  def get_genes length
    x = length
    genes = []
    while x > 0 do
      gene = Gene.new
      genes << gene
      x -= 1
    end
    genes
  end
end