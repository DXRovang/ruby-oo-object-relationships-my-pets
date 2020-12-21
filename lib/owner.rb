require "pry"

class Owner

    @@all = []

  def initialize(name)
    @name = name 
    @@all << self
  end

  def name
    @name
  end

  def species
    "human"
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats 
    Cat.all.select do |object|
      object.owner == self
    end
  end

  def dogs 
    Dog.all.select do |object|
      object.owner == self
    end
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

  def sell_pets
    dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    count_dogs = dogs.size
    count_cats = cats.size
    "I have #{count_dogs} dog(s), and #{count_cats} cat(s)."

  end

end