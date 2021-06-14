class Owner
  @@all = []
  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all = []
  end
  attr_reader :name, :species

  def initialize(name, species = 'human')
    @name = name
    @species = species
    @@all << self
  end
  def say_species
    "I am a #{@species}."
  end 
  def cats
    Cat.all.filter {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.filter {|dog| dog.owner == self}
  end
  def buy_cat(name)
    Cat.new(name, self)
  end 
  def buy_dog(name)
    Dog.new(name, self)
  end
  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end
  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end
  def pets
    cats.concat(dogs)
  end
  def sell_pets
    pets.each {|pet| pet.mood = 'nervous'}
    pets.each {|pet| pet.owner = nil}
  end
  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end