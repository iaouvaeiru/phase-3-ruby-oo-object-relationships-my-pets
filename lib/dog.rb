class Dog
  @@all = []
  def self.all
    @@all
  end
  attr_reader :name
  attr_accessor :owner, :mood
  def initialize(name, owner, mood = 'nervous')
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
  end
end