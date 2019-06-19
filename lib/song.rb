class Song 
  
  attr_accessor :name, :artist
  
  
  @@all = []
  
  def initialize(name)
    @name = name 
  end 
  
  
  def self.new_by_filename(file_name)
    parsed_file = file_name.split("-").map(&:strip)
    artist_name = parsed_file[0]
    song = parsed_file[1]
    
    new_song = Song.new(song)
    new_song.artist_name = artist_name
    new_song
  end 
  
  #"Action Bronson - Larry Csonka - indie.mp3" 
  #=> ["action branson", "larry csonka"]

  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end 