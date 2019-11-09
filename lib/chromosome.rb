require 'gene'

class Chromosome
  attr_accessor :genes
  attr_accessor :length

  def initialize length
    @length = length
    @genes = get_genes length
  end

  def decode
    decoded = []
    @genes.each do |gene|
      decoded << gene.get_value
    end
    decoded_array = self.class.filter(decoded)
  end

  def value
    decoded_array = self.decode
    self.class.math(decoded_array)
  end

  def fitness target
    # (target - self.decode) === 0 ? 1 : 1/((target - self.decode).abs() * 100)
    1 / ((target - self.value).abs() / target)
  end

  def bits
    bits = []
    @genes.each do |gene|
      bits << gene.bits
    end
    bits.join("").split("")
  end

  # Mutates each bit in every gene of the chromosome in-place (based on random chance)
  def mutate
    array_genes = []
    @genes.map { |gene| gene.bits.split("").map { |bit| array_genes << bit.to_s } }
    new_bits = []
    array_genes.each do |bit|
      chance = rand(1001)
      if chance <= 1
        if bit == "1"
          new_bits << "0"
        else
          new_bits << "1"
        end
      else
        new_bits << bit
      end
    end

    new_genes = new_bits.join("").scan(/..../).map{ |gene| Gene.new(gene) }

    @genes = new_genes
  end

  def self.filter decoded
    filtered_array = []
    state = "number"
    decoded.each do |item|
      if state == "number"
        if item.is_a? Integer
          filtered_array << item
          state = "operator"
        end
      else
        if item.is_a? String
          filtered_array << item
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