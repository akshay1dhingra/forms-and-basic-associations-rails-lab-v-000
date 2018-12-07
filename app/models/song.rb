class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre
  has_many :notes
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
    
    # or you can use the method below instead of the ternary operator "?"
    # if self.artist
    #   self.artist.name
    # end
  end
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 
  
  def genre_name
    if self.genre 
      self.genre.name 
    end 
  end 

    def note_contents=(notes)
      notes.each do |note_content|
        if note_content != ''
          self.notes.build(content: note_content)
        end
      end
    end
    
    def note_contents
      self.notes.collect { |note| note.content }
    end
  
end
