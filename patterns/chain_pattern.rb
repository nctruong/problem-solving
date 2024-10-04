# Object to be processed
class SurvivalGameTemplate
  attr_accessor :level, :name

  def initialize(level, name)
    @level = level
    @name  = name
  end
end

module Printable
  def print(name, text)
    puts "#{add_space(name, 20)} \t #{add_space(self.class.to_s, 20)} \t => #{text} resolution"
  end

  private

  def add_space(name, size)
    if name.size < size
      (size - name.size).times { name += ' ' }
      name
    else
      name[0..size]
    end
  end
end

# Handlers in chain
class TierHandler
  include Printable
  attr_accessor :level, :next_tier

  def initialize(level)
    @level = level
  end

  def handle(request)
    if can_handle?(request.level)
      process(request)
    elsif next_tier
      next_tier.handle(request)
    else
      puts "Could not handle request"
    end
  end

  def can_handle?(level)
    level <= self.level
  end

  def process(request)
    raise NotImplementedError
  end
end

class StarterTierHandler < TierHandler
  def initialize
    super(1)
  end

  def process(request)
    print(request.name, 'low')
  end
end

class PlusTierHandler < TierHandler
  def initialize
    super(2)
  end

  def process(request)
    print(request.name, 'high')
  end
end

class ProTierHandler < TierHandler
  def initialize
    super(3)
  end

  def process(request)
    print(request.name, 'super')
  end
end

# Build chain
class TierChain
  def self.setup
    starter = StarterTierHandler.new
    plus    = PlusTierHandler.new
    pro     = ProTierHandler.new

    starter.next_tier = plus
    plus.next_tier    = pro

    starter
  end
end

tier = TierChain.setup

crafting_system = SurvivalGameTemplate.new(1, 'Crafting Feature')
hotbar_system   = SurvivalGameTemplate.new(1, 'Hotbar Feature')
building_system = SurvivalGameTemplate.new(2, 'Building Feature')
farming_system  = SurvivalGameTemplate.new(3, 'Farming Feature')

tier.handle(crafting_system)
tier.handle(hotbar_system)
tier.handle(building_system)
tier.handle(farming_system)


