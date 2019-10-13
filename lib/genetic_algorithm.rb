require 'gene'
require 'chromose'
require 'population'

class GeneticAlgorithm
  def initialize target, size_of_population, max_generation
    @target = target
    @size_of_population = size_of_population
    @max_generation = max_generation
  end

  def run
  end
end