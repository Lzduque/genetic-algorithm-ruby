class Gene
  def initialize
    @bits = create()
  end

  def value
    value = {"0000" => 0,
              "0001" => 1,
              "0010" => 2,
              "0011" => 3,
              "0100" => 4,
              "0101" => 5,
              "0110" => 6,
              "0111" => 7,
              "1000" => 8,
              "1001" => 9,
              "1010" => +,
              "1011" => -,
              "1100" => *,
              "1101" => /
    }

  end

  private
  def create
    gene = "#{rand(2)}#{rand(2)}#{rand(2)}#{rand(2)}"
  end
end