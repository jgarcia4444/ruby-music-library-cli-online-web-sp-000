class MusicLibraryController

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets.strip
    while user_input != "exit"
      user_input = gets.strip
    end
  end

  def list_songs
    songs = Song.all.sort {|x, y| x.name <=> y.name}
    counter = 1
    songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    artists = Artist.all.sort {|x, y| x.name <=> y.name}
    artists.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort {|x, y| x.name <=> y.name}
    genres.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if Artist.all.detect {|artist| artist.name == user_input}
      chosen_artist = Artist.all.detect {|artist| artist.name == user_input}
      artist_songs = chosen_artist.songs
      artist_songs.sort {|x,y| x.name <=> y.name}.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if Genre.all.detect {|genre| genre.name == user_input}
      chosen_genre = Genre.all.detect {|genre| genre.name == user_input}
      genre_songs = chosen_genre.songs
      genre_songs.sort {|x, y| x.name <=> y.name}.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    
  end

end
