class Song 

attr_accessor :name
  
@@all = [] 


def self.all 
  @@all
end
  
def initialize(name, artist = nil, genre = nil)
  @name = name 
  self.artist = artist if artist
  self.genre = genre if genre 
  save
end

def genre
  @genre
end

def genre=(genre)
  @genre=genre
  genre.songs.push self unless genre.songs.include? self 
  
end

def artist
  @artist
end

def artist=(artist)
  @artist=artist
  artist.add_song(self)
end
  
def self.destroy_all
  @@all = []
end

def save
  @@all << self  
end
  
def self.create(name)
  self.new(name)
end
  
def self.find_by_name(name)
  @@all.find do |song|
  song.name == name
  end
end
  
def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end
  
  
end