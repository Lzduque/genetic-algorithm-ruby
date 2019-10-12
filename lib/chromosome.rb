require './gene'

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
    decoded_array = filter(decoded)
    p decoded_array
    # return math(decoded_array)
  end

  def fitness target
  end

  def bits
  end

  def mutate position
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

  def filter decoded
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

  def math array
    result = 0
    current_array = array
    array.each_with_index do |item, i|
      array[i].send(array[i + 1].to_sym, array[i + 2])
      current_array.slice(i + 3)
    end
  end
end