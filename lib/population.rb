require 'gene'
require 'chromosome'

class Population
  attr_accessor :target, :size, :chrome_length, :chromosomes, :total_fitness
  def initialize target, size, chrome_length, max_generations
    @target = target
    @size = size
    @chrome_length = chrome_length
    @chromosomes = get_chromosomes
    @total_fitness = 0
    @max_generations = max_generations
    winner = self.run
    p "winner is: #{winner}"
    p "winner equation is: #{winner.decode.join(" ")}"
    p "winner final value is: #{winner.value}"
  end

  end

  def check_for_winner
    @chromosomes.each do |chromosome|
      if chromosome.fitness == (1/0.0)
        return chromosome
      end
    end
    return nil
  end

  def generate_roulette_wheel
    @total_fitness = 0
    @chromosomes.each do |chromosome|
      @total_fitness += chromosome.fitness
    end
    @chromosomes
  end

  def pick_chromosome
    pick_you = rand(0.0...@total_fitness)
    p "Total fitness: #{@total_fitness}"
    p "Pick_you: #{pick_you}"
    acc = 0
    @chromosomes.each do |chromosome|
      acc += chromosome.fitness
      p "acc: #{acc}"
      if pick_you.nil?
        pick_you = 0.0
      end
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
      chromosome = Chromosome.new(@chrome_length, @target)
      chromosomes << chromosome
      x -= 1
    end
    chromosomes
  end
end