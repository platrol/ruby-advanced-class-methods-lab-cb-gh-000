require "pry"
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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  #  binding.pry
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
end

def self.find_by_name(song_name)
  @@all.find do |s|
    s.name == song_name
  end
end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
      self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    split_name = filename.split(/[-.]/).delete_if{|w| w == "mp3"}
    name = split_name[1].strip
    artist_name = split_name[0].strip
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
