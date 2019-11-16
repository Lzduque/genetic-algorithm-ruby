require 'gene'
require 'chromosome'

class Population
  attr_accessor :target, :size, :chrome_length, :chromosomes, :total_fitness
  def initialize target, size, chrome_length
    @target = target
    @size = size
    @chrome_length = chrome_length
    @chromosomes = get_chromosomes
    @total_fitness = 0
  end

  def check_for_winner
    @chromosomes.each do |chromosome|
      if chromosome.get_fitness(@target) == (1/0.0)
        return chromosome
      end
    end
    return nil
  end

  def generate_roulette_wheel
    @total_fitness = 0
    @chromosomes.each do |chromosome|
      @total_fitness += chromosome.get_fitness(@target)
    end
    @chromosomes
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