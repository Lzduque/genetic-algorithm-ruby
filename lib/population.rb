require 'gene'
require 'chromose'

class Population
  def initialize target, chromosomes
    @target = target
    @chromosomes = [chromosomes]

  def check_for_winner
    @chromosomes.each do |chromosome|
      if chromosome.get_fitness(@target) == (1/0.0)
        return chromosome
      end
    end
    return nil
  end

  def generate_roulette_wheel
  end

  def pick_chromosome
    pick_you = rand(0.0...@total_fitness)
    acc = 0
    @chromosomes.each do |chromosome|
      acc += chromosome.fitness
      if pick_you <= acc
        return chromosome
      end
    end
    return @chromosomes.last
  end

  def crossover chromosome1, chromosome2
    chromosome1.crossover(chromosome2)
  end

  def add_chromosome chromosome
  end

private
  def get_chromosomes
    x = @size
    chromosomes = []
    while x > 0 do
      chromosome = Chromosome.new(@chrome_length)
      chromosomes << chromosome
      x -= 1
    end
    chromosomes
  end
end