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
