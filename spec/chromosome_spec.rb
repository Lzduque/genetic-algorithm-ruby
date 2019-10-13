require 'chromosome'

RSpec.describe Chromosome, "filter" do
  context "given an array of decoded genes" do
    it "returns only numbers and symbols in the right order" do
      decoded = [2, 3, 5, "-", "*", 4, 6]
      filtered_array = Chromosome.filter(decoded)
      expect(filtered_array).to eq [2, "-", 4]
    end
    it "does not reyurn a symbol in the end" do
      decoded = [2, 3, 5, "-", "*", 4, 6, "+"]
      filtered_array = Chromosome.filter(decoded)
      expect(filtered_array).to eq [2, "-", 4]
    end
  end
  context "given an array of decoded genes with only numbers" do
    it "return only the first number" do
      decoded = [2, 3, 5, 4, 6]
      filtered_array = Chromosome.filter(decoded)
      expect(filtered_array).to eq [2]
    end
  end
  context "given an array of decoded genes with no numbers" do
    it "return an empty array" do
      decoded = ["-", "*", "+"]
      filtered_array = Chromosome.filter(decoded)
      expect(filtered_array).to eq []
    end
  end
  context "given an empty array" do
    it "return an empty array" do
      decoded = []
      filtered_array = Chromosome.filter(decoded)
      expect(filtered_array).to eq []
    end
  end
end

RSpec.describe Chromosome, "math" do
  context "given an empty array" do
    it "returns the result as 0" do
      filtered_array = []
      result = Chromosome.math(filtered_array)
      expect(result).to eq 0
    end
  end
  context "given an array with just one number" do
    it "returns the result as the number" do
      filtered_array = [2]
      result = Chromosome.math(filtered_array)
      expect(result).to eq 2
    end
  end
  context "given an array of decoded and filtered genes" do
    it "does the math operations and returns the result" do
      filtered_array = [2, "+", 4, "-", 3]
      result = Chromosome.math(filtered_array)
      expect(result).to eq 3
    end
    it "does the math operations and returns the result for longer array" do
      filtered_array = [2, "+", 4, "-", 3, "+", 5, "/", 2]
      result = Chromosome.math(filtered_array)
      expect(result).to eq 4
    end
    it "does the math operations and returns the result as a negative number" do
      filtered_array = [2, "+", 4, "-", 8]
      result = Chromosome.math(filtered_array)
      expect(result).to eq -2
    end
    it "does the math operations in the right order and returns the result" do
      filtered_array = [2, "+", 4, "*", 3]
      result = Chromosome.math(filtered_array)
      expect(result).to eq 18
    end
  end
end