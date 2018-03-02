class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
     self.new
  end

  def self.create_by_name(name)
    self.create
    @@all << name

  def initialize
    @@all << self
  end

end
