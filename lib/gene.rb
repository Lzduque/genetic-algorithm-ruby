class Gene
  attr_reader :bits

  def initialize(bits = nil)
    @bits = create(bits)
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

  private
  def create bits
    if bits == nil
      @bits = "#{rand(2)}#{rand(2)}#{rand(2)}#{rand(2)}"
    else
      @bits = bits
    end
  end
end