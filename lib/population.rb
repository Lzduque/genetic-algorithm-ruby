require 'gene'
require 'chromose'

class Population
  def initialize target, chromosomes
    @target = target
    @chromosomes = [chromosomes]
  end

  def generate_roulette_wheel
  end

  def select_chromosomes
  end

  def crossover chromosome1, chromosome2
    chromosome1.crossover(chromosome2)
  end

  def add_chromosome chromosome
  end
end