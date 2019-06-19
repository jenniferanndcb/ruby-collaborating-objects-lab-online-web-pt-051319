class MP3Importer
  
  attr_accessor :path 
  
  def initialize(path)
    @path = path 
  end 
  
  def files
    file = Dir.glob("#{@path}/*.mp3") #=>finds pattern and returns array of matching filenames
      file.collect do |f| f.gsub("#{@path}/", "") #=>replaces with no path 
    end
  end 
  
  def import #=> MP3Importer.new(filepath).import 
    self.files.each {|file| Song.new_by_filename}
  end 
  
end 