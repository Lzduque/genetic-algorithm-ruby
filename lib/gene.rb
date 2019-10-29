class Gene
  attr_reader :bits

  def initialize
    @bits = create()
  end

  def get_value
    value = { "0000" => 0,
              "0001" => 1,
              "0010" => 2,
              "0011" => 3,
              "0100" => 4,
              "0101" => 5,
              "0110" => 6,
              "0111" => 7,
              "1000" => 8,
              "1001" => 9,
              "1010" => "+",
              "1011" => "-",
              "1100" => "*",
              "1101" => "/"
    }
    value[@bits]
  end

  # def opposite gene
  #   gene_array = gene.split("")
  #   opposite_array = []
  #   gene_array.each do |bit|
  #     if bit == "0"
  #       opposite_array << "1"
  #     else
  #       opposite_array << "0"
  #     end
  #   end
  #   opposite_array.join("")
  # end

  private
  def create
    gene = "#{rand(2)}#{rand(2)}#{rand(2)}#{rand(2)}"
  end
end